import Vue from 'vue'
import Vuex from 'vuex'
import { BigNumber } from 'bignumber.js'
import axios from 'axios'
//import * as ethUtil from 'ethereumjs-util'

import abiPUMPKITTENS from '@/abi/pumpkittens.json'

BigNumber.config({ EXPONENTIAL_AT: 100 })

// const ADDR_NULL = '0x0000000000000000000000000000000000000000';
const ADDR_OWNER = '0x2C4C168A2fE4CaB8E32d1B2A119d4Aa8BdA377e7'
const ADDR_TOKEN_PUMP_KITTENS = '0x93BC0a591685098433dCc990da7f006812EB7601'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    account: null,
    messageContent: null,
    messageType: null,
    searchResult:false,
    contracts: {
        tokenPumpKittens: null,
    },
    pumpkittens: {
        totalSupply: Number,
        price: BigNumber,
        tokenIds: [],
        tokenPrices:[],
        tokenURIs:[],
        imageURIs:[],
        tokenNames:[],
        tokenAttributes:[]
    },
    isOwner() {
        if(this.account==null)
            return false
        return this.account.address==ADDR_OWNER
    }
  },
  mutations: {
    init(state) {
        state.contracts.tokenPumpKittens = new window.web3.eth.Contract(abiPUMPKITTENS, ADDR_TOKEN_PUMP_KITTENS);
    },
    set_account(state,account) {
        state.account = account      
    },
    show_info(state,message) {
        state.messageContent = message
        state.messageType = 'info'
    },
    show_success(state,message) {
        state.messageContent = message
        state.messageType = 'success'
    },
    show_error(state,message) {
        state.messageContent = message
        state.messageType = 'error'
    },
    show_warning(state,message) {
        state.messageContent = message
        state.messageType = 'warning'
    },
    read_pumpkittens(state) {
        state.contracts.tokenPumpKittens.methods.totalSupply().call().then((ret)=>{
            state.pumpkittens.totalSupply = BigNumber(ret);
            }).catch((error)=>{
            console.error("tokenBQB.totalSupply",error)
        });
        state.contracts.tokenPumpKittens.methods.getPrice().call().then((ret)=>{
          state.pumpkittens.price = BigNumber(ret);
        }).catch((error)=>{
          console.error("tokenBQB.totalSupply",error)
        });
      },
  },
  method: {
    fetchData(url){
        axios.get(url).then(response => {
           console.log(response);
        })
    },
  },
  actions: {
    connect({commit}) {
      window.ethereum.request({ 
          method: 'eth_requestAccounts' 
      }).then((accounts) => {
          if(accounts.length==0) {
              console.log("No connected");
          } else {
            window.ethereum.request({
              method: 'wallet_switchEthereumChain',
              params: [{ chainId: '0xfa2' }],
            }).then(() => {
              console.log("wallet_switchEthereumChain")
              const account = {
                address: accounts[0],
                //balance: BigNumber(balance,"ether")
              }
              commit('show_success','Connected')
              commit('set_account',account)
              commit('read_pumpkittens')
            }).catch(error => {
              console.log("error:wallet_switchEthereumChain",error)
              if (error.code==4902 || error.code==-32603) {
                window.ethereum.request({
                  method: 'wallet_addEthereumChain',
                  params: [{ 
                    chainId: '0xfa2', 
                    chainName: 'FantomNetwork',
                    rpcUrls: ['https://rpc.testnet.fantom.network'],
                    blockExplorerUrls: ['https://testnet.ftmscan.com'],
                    nativeCurrency: {
                      name: 'Fantom',
                      symbol: 'FTM',
                      decimals: 18
                    }
                  }],
                }).then(() => {
                  const account = {
                    address: accounts[0],
                  }
                  commit('set_account',account)
                  commit('read_pumpkittens')
                }).catch(() => {
                  console.log("error:wallet_switchEthereumChain")
                });
              }
            });
          }
      }).catch((err) => {
        if (err.code === 4001) {
          console.log('Please connect to MetaMask.');
        } else {
          console.error(err);
        }
      });  
    },
    async getTokenIdsOfOwner({state, commit},params) {
        if (!window.web3.utils.isAddress(params.account))
        {
            commit('show_warning', 'Address Error!');
            return;
        }

        await state.contracts.tokenPumpKittens.methods.getTokenIdsOfOwner(params.account).call({
            from: state.account.address
        }).then((ret)=>{
            state.pumpkittens.tokenIds = ret[0];
            state.pumpkittens.tokenPrices = ret[1];
            state.pumpkittens.tokenURIs = ret[2];
        })
    },
    async constructTokenInfo({state,commit}, params) {
        if (!window.web3.utils.isAddress(params.account))
        {
            return;
        }
        let nlength = state.pumpkittens.tokenURIs.length;

        if (nlength == 0)
        {
            state.searchResult = false;
            return;
        }

        let imageURLs = [];
        let tokenNames = [];
        let tokenAttributes = [];

        for(let i = 0;i<nlength;i++) {
            await axios.get(state.pumpkittens.tokenURIs[i], {
                }).then(x => {
                    imageURLs.push(x.data.image);
                    tokenNames.push(x.data.name);
                    tokenAttributes.push(x.data.attributes);
                })
        }

        state.pumpkittens.imageURIs = imageURLs;
        state.pumpkittens.tokenNames = tokenNames;
        state.pumpkittens.tokenAttributes = tokenAttributes;
        
        state.searchResult = true;
        commit('show_success', 'Success!');
    },
    disconnect({state}) {
        state.account = null
    },
    mint({state,commit}) {
        state.contracts.tokenPumpKittens.methods.buyPumpKittens().send({
            from: state.account.address,
            value:BigNumber(state.pumpkittens.price).integerValue().toString()
          }).then(()=>{
            commit('show_success', 'Success!');
            commit('read_pumpkittens');
        })
    },
    readTextFile(file, callback) {
        var rawFile = new XMLHttpRequest();
        rawFile.overrideMimeType("application/json");
        rawFile.open("GET", file, true);
        rawFile.onreadystatechange = function() {
            if (rawFile.readyState === 4 && rawFile.status == "200") {
                callback(rawFile.responseText);
            }
        }
        rawFile.send(null);
    },
    transferToken({state,commit}, params) {
        if (!window.web3.utils.isAddress(params.to))
        {
            commit('show_warning', 'Address Error!');
            return;
        }

        state.contracts.tokenPumpKittens.methods.safeTransferFrom(state.account.address, params.to, params.tokenID)
        .send({
            from: state.account.address
          }).then(()=>{
            commit('show_success', 'Success!');
        })
    },
  }
})

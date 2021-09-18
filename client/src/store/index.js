import Vue from 'vue'
import Vuex from 'vuex'
import { BigNumber } from 'bignumber.js'
import axios from 'axios'

import abiPUMPKITTENS from '@/abi/pumpkittens.json'

BigNumber.config({ EXPONENTIAL_AT: 100 })

const ADDR_OWNER = '0x2C4C168A2fE4CaB8E32d1B2A119d4Aa8BdA377e7'
const ADDR_TOKEN_PUMP_KITTENS = '0xe3aCbA7a02F267e5F0F2ed1756fa2E1552135FF8'
const MAXIMUM_MINT_TOKEN = 8;

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
      console.log(423424234);
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
        if (state.account==null)
        {
            commit('show_warning', 'Please connect Wallet!');
            return false;         
        }

        if (!window.web3.utils.isAddress(params.account))
        {
            commit('show_warning', 'Address Error!');
            return false;
        }

        await state.contracts.tokenPumpKittens.methods.getTokenIdsOfOwner(params.account).call({
            from: state.account.address
        }).then((ret)=>{
            state.pumpkittens.tokenIds = ret[0];
            state.pumpkittens.tokenPrices = ret[1];
            state.pumpkittens.tokenURIs = ret[2];

            return true;
        })

        return true;
    },
    async constructTokenInfo({state,commit}) {
        let nlength = state.pumpkittens.tokenURIs.length;

        if (nlength == 0)
        {
            state.searchResult = false;
            commit('show_warning', 'No Result!');

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
    },
    disconnect({state}) {
        state.account = null
    },
    mint({state,commit}) {
        if (state.account==null)
        {
          commit('show_warning', 'Please connect Wallet!');
          return;         
        }

        if (state.pumpkittens.totalSupply == MAXIMUM_MINT_TOKEN)
        {
          commit('show_warning', 'No More Tokens!');
          return;
        }
        state.contracts.tokenPumpKittens.methods.buyPumpKittens().send({
            from: state.account.address,
            value:BigNumber(state.pumpkittens.price).integerValue().toString()
          }).then(()=>{
            commit('show_success', 'Success!');
            commit('read_pumpkittens');
        })
    },
    transferToken({state,commit}, params) {
        if (!window.web3.utils.isAddress(params.to))
        {
            commit('show_warning', 'Address Error!');
            return false;
        }

        state.contracts.tokenPumpKittens.methods.safeTransferFrom(state.account.address, params.to, params.tokenID)
        .send({
            from: state.account.address
          }).then(()=>{
            commit('show_success', 'Success!');

            return true;
        })
    },
  }
})

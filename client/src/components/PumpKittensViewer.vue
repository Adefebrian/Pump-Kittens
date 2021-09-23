<template>
  <div class="holder">
    <div class="text-h6">Enter your wallet address to find your Pumpkittens.</div>
    <v-text-field v-model="account" class="walletForm" type="text" placeholder="Wallet Address"></v-text-field>
    <v-dialog
      v-model="dialog"
      hide-overlay
      persistent
      width="300"
      v-if="pending" 
    >
      <v-card color="primary" dark>
        <v-card-text>
          Loading ...
          <v-progress-linear
            indeterminate
            color="white"
            class="mb-0"
          ></v-progress-linear>
        </v-card-text>
      </v-card>
    </v-dialog>

    <div class="text-center">
      <v-btn @click="search" color="black" outlined elevation="4">SEARCH</v-btn>
    </div>
    <v-row class="my-7 mx-0" v-if="this.$store.state.searchResult">
      <v-col cols="4" lg="3" md="2" sm="3" class="pa-1" v-for="(imageURI,idx) in this.$store.state.pumpkittens.imageURIs"
          :key="idx">
          <SendDialog :id="tokenId(idx)" :account="searchAccount()" :name="tokenName(idx)" />
          <v-img
              :src="imageURI"
              contain
          />
          <div class="sub_panel">
            <div class = "tokenNames">{{tokenName(idx)}}</div>
            <div class = "tokenPrice">Price : {{tokenPrice(idx).toFormat(3)}} FTM</div>
            <div class = "attributes">Attributes</div>
            <div class = "attribute" v-for="(attribute,idx_1) in tokenAttributes(idx)"
                :key="idx_1">
              <div class="att_title">{{attribute.trait_type}}</div>
              <li class="text-sm">{{attribute.value}}</li>
            </div>
          </div>
      </v-col>
    </v-row>
  </div>
</template>
<script>
import BigNumber from 'bignumber.js';
import SendDialog from "@/components/sendDialog.vue";
export default {
  name: "PumpKittensViewer",
  components: {SendDialog},
  data() {
    return {
      account: null,
      pending: false,
      error: false,
      dialog: true,
    };
  },
  computed: {
  },
  mounted() {
  },
  methods: {
    tokenPrice(index) {
      return BigNumber(this.$store.state.pumpkittens.tokenPrices[index]).shiftedBy(-18);
    },
    tokenId(index) {
      return this.$store.state.pumpkittens.tokenIds[index];
    },
    tokenName(index) {
      return this.$store.state.pumpkittens.tokenNames[index];
    },
    searchAccount() {
      return this.account;
    },
    tokenAttributes(index) {
      return this.$store.state.pumpkittens.tokenAttributes[index];
    },
    async search() {         
      this.pending = true;
      try {
        let result;
        result = await this.$store.dispatch('getTokenIdsOfOwner', {
          account:this.account
        })

        if (!result)
        {
          this.pending = false;
          this.error = true;
          return;
        }

        await this.$store.dispatch('constructTokenInfo')

        this.error = false;
      }
      catch (e) {
        this.error = e;
      }
      this.pending = false;
    },
  }
};
</script>

<style>
  .action {
      background: white;
      border: black;
      border-radius: 2px;
      cursor: pointer;
      width:30%;
      margin-bottom: 1px;
  }

  .tokenNames {
      text-align: center;
      background: white;
      border: black;
  }

  .sub_panel {
      background: white;
      border: black;
      margin: 1px 0px;
      padding: 5px 10px;
      font-size: 12px;
      color:black;
      height:350px;
  }

  .tokenPrice {
      font-weight: bold;
  }

  .attributes {
    font-weight: bold;
    text-decoration: underline!important;
  }

  .att_title {
    font-weight: bold;
    margin-left: 5px;
  }

  li {
    margin-left: 10px;
  }

</style>


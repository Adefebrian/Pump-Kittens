<template>
  <div class="">
    <div class="text-center text-h5 font-weight-bold">{{totalSupply}} / 4 PumpKittens Minted</div>
    <v-row class="my-7 mx-0">
      <v-col cols="4" lg="2" md="2" sm="3" class="pa-1" v-for="(profile,idx) in profiles"
            :key="idx">
        <v-img
            :src="profile.url"
            contain
        />
      </v-col>
    </v-row>
    <div class="text-center">
      <v-btn @click="mint" color="black" outlined elevation="4">MINT MY PUMPKITTEN!</v-btn>
      <div class="hilight">price : {{nftPrice.toFormat(3)}} FTM</div>
    </div>

  </div>
</template>

<script>
import BigNumber from 'bignumber.js'
export default {
  name: "Mint",
  data() {
    return {
      title: "details",
      profiles: [
        {url: require("../images/1.png")},
        {url: require("../images/2.png")},
        {url: require("../images/3.png")},
        {url: require("../images/4.png")},
/*        {url: require("../images/5.png")},
        {url: require("../images/6.png")},
        {url: require("../images/7.png")},
        {url: require("../images/8.png")},
        {url: require("../images/9.png")},
        {url: require("../images/10.png")},
        {url: require("../images/11.png")},
        {url: require("../images/12.png")},*/
      ],
    };
  },
  computed: {
      nftPrice() {
        if(this.$store.state.account) {
          return BigNumber(this.$store.state.pumpkittens.price).shiftedBy(-18);
        }
        
        return BigNumber(0);
      },
      totalSupply() {
        if(this.$store.state.account) {
          return Number(this.$store.state.pumpkittens.totalSupply);
        }
        
        return Number(0);
      },
  },
  mounted() {
      this.$store.commit('read_pumpkittens')
  },
  methods: {
      mint() {                
          this.$store.dispatch('mint')              
      },

  }
};
</script>

<style>
    .hilight {
        color:#ffff00;
        margin-left: 10px;
        font-family: sans-serif;
        font-size: 14px;
    }
</style>
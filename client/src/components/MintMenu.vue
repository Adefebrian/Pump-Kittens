<template>
  <div class="">
    <div class="text-center text-h5 font-weight-bold">{{totalSupply}} / 100 Pumpkittens Minted</div>
<!--    <v-row class="my-7 mx-0">
      <v-col cols="4" lg="2" md="2" sm="3" class="pa-1" v-for="(profile,idx) in profiles"
            :key="idx">
        <v-img
            :src="profile.url"
            contain
        />
      </v-col>
    </v-row>-->
    <v-img :src="require('@/assets/homepage-show.jpeg')"></v-img>
    <div class="text-center my-5">
      <v-btn @click="mint" color="black" outlined elevation="4">MINT MY PUMPKITTEN!</v-btn>
      <div class="hilight">Price : {{nftPrice.toFormat(3)}} FTM</div>
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
      this.$store.commit('read_pumpkittens');
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
        color:#000000;
        margin-left: 10px;
        margin-top: 5px;
        font-family: sans-serif;
        font-size: 14px;
        font-weight: bold;
    }

    .my-7 {
        opacity: .8;
    }
</style>
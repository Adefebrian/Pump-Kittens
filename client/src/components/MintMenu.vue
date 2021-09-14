<template>
  <div class="">
    <div class="text-center text-h5 font-weight-bold">{{totalSupply}} / 500 Bit Umans Minted</div>
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
      <v-btn @click="mint" color="black" outlined elevation="4">MINT MY UMAN!</v-btn>
      <div class="hilight">price : {{nftPrice.toFormat(2)}} FTM</div>
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
        {url: 'https://gateway.pinata.cloud/ipfs/QmaCVZhWEouMZuZkEgLumahHKvYe6RJ4jJCsmuAd3TkmrT/1.png'},
        {url: 'https://gateway.pinata.cloud/ipfs/QmaCVZhWEouMZuZkEgLumahHKvYe6RJ4jJCsmuAd3TkmrT/2.png'},
        {url: 'https://gateway.pinata.cloud/ipfs/QmaCVZhWEouMZuZkEgLumahHKvYe6RJ4jJCsmuAd3TkmrT/3.png'},
        {url: 'https://gateway.pinata.cloud/ipfs/QmaCVZhWEouMZuZkEgLumahHKvYe6RJ4jJCsmuAd3TkmrT/4.png'},
        {url: 'https://gateway.pinata.cloud/ipfs/QmaCVZhWEouMZuZkEgLumahHKvYe6RJ4jJCsmuAd3TkmrT/5.jpeg'},
        {url: 'https://gateway.pinata.cloud/ipfs/QmaCVZhWEouMZuZkEgLumahHKvYe6RJ4jJCsmuAd3TkmrT/6.jpeg'},
        {url: 'https://gateway.pinata.cloud/ipfs/QmaCVZhWEouMZuZkEgLumahHKvYe6RJ4jJCsmuAd3TkmrT/7.png'},
        {url: require("../assets/pixelImage.png")},
        {url: require("../assets/pixelImage.png")},
        {url: require("../assets/pixelImage.png")},
        {url: require("../assets/pixelImage.png")},
        {url: require("../assets/pixelImage.png")},
      ],
    };
  },
  computed: {
      nftPrice() {
        if(this.$store.state.account) {
          return BigNumber(this.$store.state.pumpkittens.price);
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
      }
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
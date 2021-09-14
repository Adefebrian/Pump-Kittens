<template>
  <div class="holder">
    <div class="text-h6">Enter your wallet address to find your Umans.</div>
    <v-text-field v-model="account" class="walletForm" type="text" placeholder="Wallet Address" />
    <div class="text-center">
      <v-btn @click="search" color="black" outlined elevation="4">SEARCH</v-btn>
    </div>
  </div>
</template>
<script>
export default {
  name: "PumpKittensViewer",
  data() {
    return {
      account: null,
    };
  },
  computed: {
  },
  mounted() {
  },
  methods: {
      search() {                   
          this.$store.dispatch('getTokenIdsOfOwner', {
            account:this.account
          })                 
      },
  }
};
</script>

<style>
</style>


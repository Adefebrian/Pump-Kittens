<template>
  <v-container class="py-12">
    <notification v-if="hasMessage"/>
    <v-row>
      <v-col lg="4" cols="12">
        <v-card color="transparent">
          <v-card-text>
            <v-btn @click="currentTab = 'mint'" block large color="transparent" class="my-3">MINT</v-btn>
            <v-btn @click="currentTab = 'pumpkittens'" block large color="transparent" class="my-3">PUMPKITTENS VIEWER</v-btn>
            <v-btn @click="currentTab = 'attribute'" block large color="transparent" class="my-3">ATTRIBUTES</v-btn>
          </v-card-text>
        </v-card>

      </v-col>
      <v-col lg="8" cols="12">
        <v-card color="transparent" class="mb-3">
          <v-card-text>
            <div class="text-h6">
              <b>'Pumpkittens'</b> is a collection of <b>100 rare and unique Pumpkitten</b> NFTs
              living on the <b>Fantom blockchain.</b>
            </div>
            <ol class="list-box">
              <li class="my-1">
                Connect your Wallet
                <v-btn @click="connectWallet" v-if="isMetaMaskInstalled && !isMetaMaskConnected" color="black" outlined elevation="2" class="ml-2" small>Connect</v-btn>
                <v-btn @click="lockMetamask" v-if="isMetaMaskInstalled && isMetaMaskConnected" color="black" outlined elevation="2" class="ml-2" small>Connected</v-btn>
              </li>
              <li class="my-1">Mint Your Pumpkitten</li>
              <li class="my-1">View your Pumpkittens! (You can also send Pumpkittens to other addresses)</li>
              <li class="my-1">
                Once all Pumpkittens are minted you will be able to export them to any
                <b>ERC-721 Standard</b> compatible marketplace or addresses on Fantom.
              </li>
            </ol>
          </v-card-text>
        </v-card>
        <v-card color="transparent">
          <v-card-text>
            <Mint v-show="currentTab === 'mint'"/>
            <PumpKittensViewer v-show="currentTab === 'pumpkittens'"/>
            <Attribute v-show="currentTab === 'attribute'"></Attribute>
          </v-card-text>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import Mint from "@/components/MintMenu.vue";
import PumpKittensViewer from "@/components/PumpKittensViewer.vue";
import Attribute from "@/components/attribute";
import Notification from '@/components/notification.vue';

export default {
  name: "Attributes",
  components: {Attribute, Mint, PumpKittensViewer, Notification},
  data() {
    return {
      currentTab: "mint",
    };
  },
  computed: {
      isMetaMaskInstalled() {
          const { ethereum } = window;
          return Boolean(ethereum && ethereum.isMetaMask)
      },
      isMetaMaskConnected() {
          return this.$store.state.account!=null;
      },
      hasMessage() {
          return this.$store.state.messageContent!=null
      }
  },
  mounted() {
  },
  methods: {
      connectWallet() {                
          this.$store.dispatch("connect")              
      },
      lockMetamask() {
          this.$store.dispatch("disconnect")
      }
  }
};
</script>

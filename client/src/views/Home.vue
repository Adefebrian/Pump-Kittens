<template>
  <v-container class="py-12">
    <v-row>
      <v-col lg="4" cols="12">
        <v-card color="transparent">
          <v-card-text>
            <v-btn @click="currentTab = 'mint'" block large color="transparent" class="my-3">MINT</v-btn>
            <v-btn @click="currentTab = 'uman'" block large color="transparent" class="my-3">UMANS VIEWER</v-btn>
            <v-btn @click="currentTab = 'attribute'" block large color="transparent" class="my-3">ATTRIBUTES</v-btn>
          </v-card-text>
        </v-card>

      </v-col>
      <v-col lg="8" cols="12">
        <v-card color="transparent" class="mb-3">
          <v-card-text>
            <div class="text-h6">
              <b>Bit Umans</b> is a collection of <b>500 unique Pixel Umans</b> NFTs
              living on the <b>Fantom Network</b>
            </div>
            <ol class="list-box">
              <li class="my-1">
                Connect your Wallet
                <v-btn color="black" outlined elevation="2" class="ml-2" small>Connected</v-btn>
              </li>
              <li class="my-1">Mint your Uman</li>
              <li class="my-1">View your Umans! (You also can send BitUmans to other addresses)</li>
              <li class="my-1">
                Once all Umans are minted you will be able to export them to any
                <b>ERC-721 Standard</b> compatible marketplace running on Fantom
              </li>
            </ol>
          </v-card-text>
        </v-card>
        <v-card color="transparent">
          <v-card-text>
            <Mint v-show="currentTab === 'mint'"/>
            <UmansViewer v-show="currentTab === 'uman'"/>
            <Attribute v-show="currentTab === 'attribute'"></Attribute>
          </v-card-text>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import Mint from "@/components/MintMenu.vue";
import UmansViewer from "@/components/UmansViewer.vue";
import Attribute from "@/components/attribute";

export default {
  name: "Attributes",
  components: {Attribute, Mint, UmansViewer},
  data() {
    return {
      currentTab: "mint",
    };
  },
};
</script>

<template>
  <div class="">
    <div class="text-center text-h5 font-weight-bold">500 / 500 Bit Umans Minted</div>
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
      <v-btn color="black" outlined elevation="4">MINT MY UMAN!</v-btn>
    </div>

  </div>
</template>

<script>
export default {
  name: "Mint",
  data() {
    return {
      title: "details",
      profiles: [
        {url: require("../assets/pixelImage.png")},
        {url: require("../assets/pixelImage.png")},
        {url: require("../assets/pixelImage.png")},
        {url: require("../assets/pixelImage.png")},
        {url: require("../assets/pixelImage.png")},
        {url: require("../assets/pixelImage.png")},
        {url: require("../assets/pixelImage.png")},
        {url: require("../assets/pixelImage.png")},
        {url: require("../assets/pixelImage.png")},
        {url: require("../assets/pixelImage.png")},
        {url: require("../assets/pixelImage.png")},
        {url: require("../assets/pixelImage.png")},

      ],
    };
  },
};
</script>

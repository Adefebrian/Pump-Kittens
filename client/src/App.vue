<template>
    <v-app>
        <v-app-bar fixed app color="#FC748D" elevation="2">
            <v-container>
                <v-row align="center">
                    <div class="d-flex align-center">
                        <v-img :src="require('@/assets/favicon.png')" height="40px" contain width="40px"></v-img>
                        <span class="text-h6 font-weight-bold pl-2">Pumpkittens</span>
                    </div>
                    <v-spacer></v-spacer>
                    <v-btn text small>Home</v-btn>
                    <v-btn text small>Help</v-btn>
                </v-row>
            </v-container>
        </v-app-bar>
        <v-main>
            <router-view/>
        </v-main>
        <v-footer style="z-index: 1" color="transparent" elevation="2">
            <v-container class="py-3">
              <div class="text-center font-weight-bold black--text pb-2">Our Socials</div>
              <v-row align="center" justify="center">
                <v-btn icon class="ma-1">
                  <v-icon>mdi-facebook</v-icon>
                </v-btn>
                <v-btn icon class="ma-1">
                  <v-icon>mdi-github</v-icon>
                </v-btn>
                <v-btn icon class="ma-1">
                  <v-icon>mdi-twitter</v-icon>
                </v-btn>
              </v-row>
              <v-row></v-row>
              <div class="text-center font-weight-bold black--text pt-5">
                &copy; 2021 Pumpkittens.
              </div>
            </v-container>
        </v-footer>
    </v-app>
</template>

<script>

    export default {
        name: 'App',

        data: () => ({
            //
        }),
    };
</script>

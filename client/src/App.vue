<template>
    <v-app>
        <v-app-bar fixed app elevation="2" class="header">
            <v-container>
                <v-row align="center">
                    <div class="d-flex align-center">
                        <a href="https://pumpkitten.com" class="link">
                        <v-img :src="require('@/assets/favicon.png')" height="40px" contain width="40px"></v-img>
                        </a>
                        <span class="text-h6 font-weight-bold pl-2">Pumpkittens</span>
                    </div>
                    <v-spacer></v-spacer>
                    <v-btn text small><a href="https://pumpkitten.com" class="link">Home</a></v-btn>
                    <v-btn text small><a href="https://twitter.com/pumpkittens" class="link">Help</a></v-btn>
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
                  <a href="" class="link"><v-icon>mdi-facebook</v-icon></a>
                </v-btn>
                <v-btn icon class="ma-1">
                  <a href="" class="link"><v-icon>mdi-github</v-icon></a>
                </v-btn>
                <v-btn icon class="ma-1">
                  <a href="https://twitter.com/Pumpkittens" class="link"><v-icon>mdi-twitter</v-icon></a>
                </v-btn>
              </v-row>
              <v-row></v-row>
              <div class="text-center font-weight-bold black--text pt-5">
                &copy; 2021 Pumpkittens
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

<style scoped>
.link {
    color: rgb(70, 36, 70);
    margin: 5px 0;
    text-decoration: none;
}

.header {
    background: rgb(45 158 220 / 14%);
}
</style>

import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store"
import Web3 from "web3/lib"
import Toast from "vue-toastification";
import "@/assets/app.scss";
import "vue-toastification/dist/index.css";
import vuetify from "./plugins/vuetify"

Vue.config.productionTip = false
Vue.use(Toast, {
  transition: "Vue-Toastification__bounce",
  maxToasts: 20,
  newestOnTop: true
});

new Vue({
  router,
  store,
  beforeCreate() {
    const { ethereum } = window;
    if(ethereum && ethereum.isMetaMask) {
      window.web3 = new Web3(ethereum);
      store.commit('init')
    }
 //   this.$q.dark.set(true);
  },
  vuetify,
  render: (h) => h(App)
}).$mount("#app");

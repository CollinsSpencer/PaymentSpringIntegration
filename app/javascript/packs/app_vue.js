/* eslint no-console: 0 */

import Vue from 'vue/dist/vue.esm'
import axios from 'axios'
import VueAxios from 'vue-axios'
import VueJsonp from 'vue-jsonp'
import CheckoutSingle from '../components/CheckoutSingle.vue'
import CheckoutSubscribe from '../components/CheckoutSubscribe.vue'
import RocksFooter from '../components/RocksFooter.vue'

Vue.use(VueAxios, axios);
Vue.use(VueJsonp);

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#app',
    data: {
      message: "Can you say hello?"
    },
    components: { CheckoutSingle, CheckoutSubscribe, RocksFooter }
  })
})

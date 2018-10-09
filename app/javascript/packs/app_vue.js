/* eslint no-console: 0 */

import Vue from 'vue/dist/vue.esm'
import BootstrapVue from 'bootstrap-vue'
import Checkout from '../components/Checkout.vue'
import RocksFooter from '../components/RocksFooter.vue'

Vue.use(BootstrapVue);

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#app',
    data: {
      message: "Can you say hello?"
    },
    components: { Checkout, RocksFooter }
  })
})

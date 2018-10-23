/* eslint no-console: 0 */

import Vue from 'vue/dist/vue.esm'
import BootstrapVue from 'bootstrap-vue'
import CheckoutSingle from '../components/CheckoutSingle.vue'
import CheckoutSubscribe from '../components/CheckoutSubscribe.vue'
import RocksFooter from '../components/RocksFooter.vue'

Vue.use(BootstrapVue);

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#app',
    data: {
      message: "Can you say hello?"
    },
    components: { CheckoutSingle, CheckoutSubscribe, RocksFooter }
  })
})

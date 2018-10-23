<template>
  <div>
    <div class="px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
      <h1 class="display-4">Box of Rocks</h1>
      <h1>Checkout</h1>
      <h3>Just this once</h3>
    </div>

    <div class="container">
      <div class="row justify-content-md-center">
        <div class="col-md-8">
          <form class="needs-validation" novalidate="">
            <checkout v-bind.sync="checkoutprops"></checkout>

            <hr class="mb-4">
            <button class="btn btn-primary btn-lg btn-block" type="submit" v-on:click="submit">Checkout</button>

          </form>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import Checkout from './Checkout.vue';
  import VueJsonp from 'vue-jsonp';

  export default {
    components: {
      Checkout
    },
    data () {
      return {
        checkoutprops: {
          firstName: "",
          lastName: "",
          ccName: "",
          ccNumber: "",
          ccExpirationMonth: "",
          ccExpirationYear: "",
          ccCvv: "",
          email: "",
        }
      }
    },
    methods: {
      submit: function () {
        let vm = this;

        // Not ideal location...
        let publicKey = 'test_ca3eaf7dca977c9c98a7a7e6bf1b35f287a96cae7c12df80cf2a40e5b4';

        data = {
          'public_api_key': publicKey,
          'card_number': vm.ccNumber,
          'card_exp_month': vm.ccExpirationMonth,
          'card_exp_year': vm.ccExpirationYear,
          'csc': vm.ccCvv,
          'card_owner_name': vm.ccName
        },

        vm.$jsonp('https://api.paymentspring.com/api/v1/tokens/jsonp', data).then(json => {
          // Success.
          // Send directly down to backend.
          const customerInfo = {
            ...json,
            'first_name': vm.firstName,
            'last_name': vm.lastName,
            'email': vm.email
          };
          vs.$http.post('/single_payment', customerInfo);
        }).catch(err => {
          // Failed.
          alert("fail");
        });
      }
    }
  }
</script>


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
            <button class="btn btn-primary btn-lg btn-block" v-on:click="submit($event)">Checkout</button>

          </form>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import Checkout from './Checkout.vue';

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
      submit (e) {
        e.preventDefault();
        let vm = this;

        // Not ideal location...
        const publicKey = 'test_ca3eaf7dca977c9c98a7a7e6bf1b35f287a96cae7c12df80cf2a40e5b4';

        const data = {
          'public_api_key': publicKey,
          'card_number': vm.checkoutprops.ccNumber,
          'card_exp_month': vm.checkoutprops.ccExpirationMonth,
          'card_exp_year': vm.checkoutprops.ccExpirationYear,
          'csc': vm.checkoutprops.ccCvv,
          'card_owner_name': vm.checkoutprops.ccName,
        };

        vm.$jsonp('https://api.paymentspring.com/api/v1/tokens/jsonp', data).then(json => {
          // Success.
          // Send directly down to backend.
          const customerInfo = {
            ...json,
            'first_name': vm.checkoutprops.firstName,
            'last_name': vm.checkoutprops.lastName,
            'email': vm.checkoutprops.email
          };
          vm.$http.post('/single_payment', customerInfo).then(window.location.href = "/confirmation");
        }).catch(err => {
          // Failed.
            window.location.href = "/fail";
        });
      }
    }
  }
</script>


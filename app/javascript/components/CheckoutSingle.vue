<template>
  <div>
    <div class="px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
      <h1 class="display-4">Box of Rocks</h1>
      <h1>Checkout</h1>
    </div>

    <div class="container">
      <div class="row justify-content-md-center">
        <div class="col-md-8">
          <form class="needs-validation" novalidate="">
            <checkout v-model="checkoutprops"></checkout>

            <hr class="mb-4">
            <button class="btn btn-primary btn-lg btn-block" type="submit" vue-on:click="submit">Continue to checkout</button>

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
          firstName: "Test",
          lastName: "",
          ccName: "",
          ccNumber: "",
          ccExpirationMonth: "",
          ccExpirationYear: "",
          ccCvv: "",
        }
      }
    }
  }
</script>


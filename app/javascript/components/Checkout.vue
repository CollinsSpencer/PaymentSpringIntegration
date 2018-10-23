<template>
  <div>
    <h4 class="mb-3">Billing address</h4>

    <div class="row">
      <div class="col">
        <label for="firstName">First name</label>
        <input type="text" class="form-control" id="firstName" placeholder="" value="" required="" :value="firstName" @input="$emit('update:firstName', $event.target.value)">
        <div class="invalid-feedback">
          Valid first name is required.
        </div>
      </div>
      <div class="col">
        <label for="lastName">Last name</label>
        <input type="text" class="form-control" id="lastName" placeholder="" value="" required="" :value="lastName" @input="$emit('update:lastName', $event.target.value)">
        <div class="invalid-feedback">
          Valid last name is required.
        </div>
      </div>
    </div>

    <div class="mb-3">
      <label for="username">Username</label>
      <div class="input-group">
        <div class="input-group-prepend">
          <span class="input-group-text">@</span>
        </div>
        <input type="text" class="form-control" id="username" placeholder="Username" required="">
        <div class="invalid-feedback">
          Your username is required.
        </div>
      </div>
    </div>

    <div class="mb-3">
      <label for="email">Email <span class="text-muted">(Optional)</span></label>
      <input type="email" class="form-control" id="email" placeholder="you@example.com" :value="email" @input="$emit('update:email', $event.target.value)">
      <div class="invalid-feedback">
        Please enter a valid email address for shipping updates.
      </div>
    </div>

    <div class="mb-3">
      <label for="address">Address</label>
      <input type="text" class="form-control" id="address" placeholder="1234 Main St" required="">
      <div class="invalid-feedback">
        Please enter your shipping address.
      </div>
    </div>

    <div class="mb-3">
      <label for="address2">Address 2 <span class="text-muted">(Optional)</span></label>
      <input type="text" class="form-control" id="address2" placeholder="Apartment or suite">
    </div>

    <div class="row">
      <div class="col">
        <label for="country">Country</label>
        <select class="custom-select d-block w-100" id="country" required="">
          <option value="">Choose...</option>
          <option>United States</option>
        </select>
        <div class="invalid-feedback">
          Please select a valid country.
        </div>
      </div>
      <div class="col">
        <label for="state">State</label>
        <select class="custom-select d-block w-100" id="state" required="">
          <option value="">Choose...</option>
          <option>California</option>
        </select>
        <div class="invalid-feedback">
          Please provide a valid state.
        </div>
      </div>
      <div class="col">
        <label for="zip">Zip</label>
        <input type="text" class="form-control" id="zip" placeholder="" required="">
        <div class="invalid-feedback">
          Zip code required.
        </div>
      </div>
    </div>
    <hr class="mb-4">
    <div class="custom-control custom-checkbox">
      <input type="checkbox" class="custom-control-input" id="same-address">
      <label class="custom-control-label" for="same-address">Shipping address is the same as my billing address</label>
    </div>
    <div class="custom-control custom-checkbox">
      <input type="checkbox" class="custom-control-input" id="save-info">
      <label class="custom-control-label" for="save-info">Save this information for next time</label>
    </div>
    <hr class="mb-4">

    <h4 class="mb-3">Payment</h4>

    <div class="d-block my-3">
      <div class="custom-control custom-radio">
        <input id="credit" name="paymentMethod" type="radio" class="custom-control-input" checked="" required="">
        <label class="custom-control-label" for="credit">Credit card</label>
      </div>
      <div class="custom-control custom-radio">
        <input id="debit" name="paymentMethod" type="radio" class="custom-control-input" required="">
        <label class="custom-control-label" for="debit">Debit card</label>
      </div>
    </div>
    <div class="row">
      <div class="col">
        <label for="cc-name">Name on card</label>
        <input type="text" class="form-control" id="cc-name" placeholder="" required="" :value="ccName" @input="$emit('update:ccName', $event.target.value)">
        <small class="text-muted">Full name as displayed on card</small>
        <div class="invalid-feedback">
          Name on card is required
        </div>
      </div>
      <div class="col">
        <label for="cc-number">Credit card number</label>
        <input type="text" class="form-control" id="cc-number" placeholder="" required="" :value="ccNumber" @input="$emit('update:ccNumber', $event.target.value)">
        <div class="invalid-feedback">
          Credit card number is required
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col">
        <div class="row">
          <div class="col-12">
            <label for="cc-expiration-month">Expiration</label>
          </div>
          <div class="col-6">
            <input type="text" class="form-control" id="cc-expiration-month" placeholder="MM" required="" :value="ccExpirationMonth" @input="$emit('update:ccExpirationMonth', $event.target.value)">
          </div>
          <div class="col-6">
            <input type="text" class="form-control" id="cc-expiration-year" placeholder="YYYY" required="" :value="ccExpirationYear" @input="$emit('update:ccExpirationYear', $event.target.value)">
          </div>
          <div class="invalid-feedback">
            Expiration date required
          </div>
        </div>
      </div>
      <div class="col">
        <label for="cc-cvv">CVV</label>
        <input type="text" class="form-control" id="cc-cvv" placeholder="" required="" :value="ccCvv" @input="$emit('update:ccCvv', $event.target.value)">
        <div class="invalid-feedback">
          Security code required
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    props: {
      firstName: String,
      lastName: String,
      ccName: String,
      ccNumber: String,
      ccExpirationMonth: String,
      ccExpirationYear: String,
      ccCvv: String,
      email: String,
    },
  }
</script>

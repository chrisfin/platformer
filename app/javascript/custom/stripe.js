   // Handler when the DOM is fully loaded to make sure stripe.js is loaded
 document.addEventListener("DOMContentLoaded", function(){

  var stripe = Stripe('pk_test_3ODGlBu89xjDT3uQizYeiyUU');
  var elements = stripe.elements();
  var style = {
    base: {
      color: "#32325d",
    }
  };
  var card = elements.create("card", { style: style });
  
  card.mount("#card-element");

  // Stripe Elements errors
  card.on('change', function(event) {
  var displayError = document.getElementById('card-errors');
  if (event.error) {
      displayError.textContent = event.error.message;
    } else {
      displayError.textContent = '';
    }
  });

  // Intercept form and complete the payment when user clicks

  var form = document.getElementById('payment-form');
  var clientSecret = document.getElementById("card-button").getAttribute("data-secret");

  form.addEventListener('submit', function(ev) {
    ev.preventDefault();
    stripe.confirmCardPayment(clientSecret, {
      payment_method: {
        card: card
      }
    }).then(function(result) {
      if (result.error) {
        // Show error to your customer (e.g., insufficient funds)
        console.log(result.error.message);
      } else {
        // The payment has been processed!
        if (result.paymentIntent.status === 'succeeded') {
          // Show a success message to your customer
          // There's a risk of the customer closing the window before callback
          // execution. Set up a webhook or plugin to listen for the
          // payment_intent.succeeded event that handles any business critical
          // post-payment actions.
        }
      }
    });
  });
});
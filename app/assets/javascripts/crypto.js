function refreshPrices() {
  $.ajax({
    url: 'https://www.bitstamp.net/api/ticker/',
    type: 'GET',
    timeout: 80000,
    dataType: 'json',
    success: function(data) {
      $('#bitstamp-price').html(data.last);
    },
    error: function() {
    }
  });

  $.ajax({
    url: 'https://api.bitfinex.com/v1/pubticker/btcusd',
    type: 'GET',
    timeout: 80000,
    dataType: 'json',
    success: function(data) {
      $('#bitfinex-price').html(data.last_price);
    },
    error: function() {
    }
  });

  $.ajax({
    url: 'https://api.coinbase.com/v2/prices/spot?currency=USD',
    type: 'GET',
    timeout: 80000,
    dataType: 'json',
    success: function(data) {
      $('#coinbase-price').html(data.data.amount);
    },
    error: function() {
    }
  });
}

$( document ).ready(function() {
  refreshPrices();

  $('#refresh-prices').on('click', function() {
    $('#refresh-button').hide();
    $('#refresh-spinner').show();
    refreshPrices();
    $('#refresh-spinner').hide();
    $('#refresh-button').show();
  });
});

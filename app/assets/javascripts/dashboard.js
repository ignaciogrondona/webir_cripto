function getUrl(exchange) {
  if (exchange == 'bitstamp') {
    return 'https://www.bitstamp.net/api/v2/ticker/';
  } else if (exchange == 'bitfinex') {
    return 'https://api.bitfinex.com/v1/pubticker/';
  } else {
    return 'https://api.coinbase.com/v2/prices/';
  }
}

function fetchValues(coin, exchange) {
  var url = getUrl(exchange);

  if (coin == 'ethereum') {
    if (exchange == 'bitstamp' || exchange == 'bitfinex') {
      url += 'ethusd';
    } else {
      url += 'eth-usd/spot';
    }
  } else if (coin == 'litecoin') {
    if (exchange == 'bitstamp' || exchange == 'bitfinex') {
      url += 'ltcusd';
    } else {
      url += 'ltc-usd/spot';
    }
  } else {
    if (exchange == 'bitstamp' || exchange == 'bitfinex') {
      url += 'btcusd';
    } else {
      url += 'btc-usd/spot';
    }
  }

  $.ajax({
    url: url,
    type: 'GET',
    dataType: 'json',
    success: function(data) {
      var value;
      if (exchange == 'bitstamp') {
        value = data.last;
      } else if (exchange == 'bitfinex') {
        value = data.last_price;
      } else {
        value = data.data.amount;
      }
      $('#' + exchange + '-' + coin + '-dashboard-price').html(value);
    },
    error: function() {
    }
  });
}

function refreshDashboard() {
  // bitcoin
  fetchValues('bitcoin', 'bitstamp');
  fetchValues('bitcoin', 'bitfinex');
  fetchValues('bitcoin', 'coinbase');
  // litecoin
  fetchValues('litecoin', 'bitstamp');
  fetchValues('litecoin', 'bitfinex');
  fetchValues('litecoin', 'coinbase');
  // ethereum
  fetchValues('ethereum', 'bitstamp');
  fetchValues('ethereum', 'bitfinex');
  fetchValues('ethereum', 'coinbase');
}

$(document).on('turbolinks:load', function() {
  refreshDashboard();

  $('#refresh-dashboard').on('click', function() {
    refreshDashboard();
  });
});

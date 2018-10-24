function refreshPrices(coin) {
  var bitstampUrl = 'https://www.bitstamp.net/api/v2/ticker/';
  var bitfinexUrl = 'https://api.bitfinex.com/v1/pubticker/';
  var coinbaseUrl = 'https://api.coinbase.com/v2/prices/';

  if (coin == 'ethereum') {
    bitstampUrl += 'ethusd';
    bitfinexUrl += 'ethusd';
    coinbaseUrl += 'eth-usd/spot';
  } else if (coin == 'litecoin') {
    bitstampUrl += 'ltcusd';
    bitfinexUrl += 'ltcusd';
    coinbaseUrl += 'ltc-usd/spot';
  } else {
    bitstampUrl += 'btcusd';
    bitfinexUrl += 'btcusd';
    coinbaseUrl += 'btc-usd/spot';
  }

  $.ajax({
    url: bitstampUrl,
    type: 'GET',
    dataType: 'json',
    success: function(data) {
      $('#bitstamp-' + coin + '-price').html(data.last);
    },
    error: function() {
    }
  });

  $.ajax({
    url: bitfinexUrl,
    type: 'GET',
    dataType: 'json',
    success: function(data) {
      $('#bitfinex-' + coin + '-price').html(data.last_price);
    },
    error: function() {
    }
  });

  $.ajax({
    url: coinbaseUrl,
    type: 'GET',
    dataType: 'json',
    success: function(data) {
      $('#coinbase-'+ coin +'-price').html(data.data.amount);
    },
    error: function() {
    }
  });
}

$(document).on('turbolinks:load', function() {
  refreshPrices('dashboard');
  refreshPrices('litecoin');
  refreshPrices('bitcoin');
  refreshPrices('ethereum');

  $('#refresh-prices, #refresh-litecoin-prices, #refresh-bitcoin-prices, #refresh-ethereum-prices').on('click', function() {
    buttonId = $(this).attr('id');
    coin = buttonId.match(new RegExp('refresh-' + "(.*)" + '-prices'))[1];
    refreshPrices(coin);
  });
});

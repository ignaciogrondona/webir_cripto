function refreshPrices(coin) {
  var bitstampUrl = 'https://www.bitstamp.net/api/v2/ticker/';
  var bitfinexUrl = 'https://api.bitfinex.com/v1/pubticker/';
  var coinbaseUrl = 'https://api.pro.coinbase.com/products/';

  if (coin == 'ethereum') {
    bitstampUrl += 'ethusd';
    bitfinexUrl += 'ethusd';
    coinbaseUrl += 'eth-usd/ticker/';
  } else if (coin == 'litecoin') {
    bitstampUrl += 'ltcusd';
    bitfinexUrl += 'ltcusd';
    coinbaseUrl += 'ltc-usd/ticker/';
  } else {
    bitstampUrl += 'btcusd';
    bitfinexUrl += 'btcusd';
    coinbaseUrl += 'btc-usd/ticker/';
  }

  $.ajax({
    url: bitstampUrl,
    type: 'GET',
    dataType: 'json',
    success: function(data) {
      createCoin(coin, 'bitstamp', data.bid, data.ask, new Date($.now()));
    },
    error: function() {
    }
  });

  $.ajax({
    url: bitfinexUrl,
    type: 'GET',
    dataType: 'json',
    success: function(data) {
      createCoin(coin, 'bitfinex', data.bid, data.ask, new Date($.now()));
    },
    error: function() {
    }
  });

  $.ajax({
    url: coinbaseUrl,
    type: 'GET',
    dataType: 'json',
    success: function(data) {
      createCoin(coin, 'coinbase', data.bid, data.ask, new Date($.now()));
    },
    error: function() {
    }
  });
}

function createCoin(coin, exchange, bid, ask, datetime) {
  var exchange_id;
  if (exchange == 'bitstamp') {
    exchange_id = 1;
  } else if (exchange == 'bitfinex') {
    exchange_id = 2;
  } else if (exchange == 'coinbase') {
    exchange_id = 3;
  }

  if (coin == 'dashboard') {
    path = 'bitcoin'
  } else {
    path = coin
  }

  var url = 'http://localhost:3000/' + path;
  var data = {
    currency_price: {
      exchange_id: exchange_id,
      bid_price: bid,
      ask_price: ask,
      datetime: datetime
    }
  }

  $.ajax({
    url: url,
    type: 'POST',
    dataType: 'json',
    data: data,
    success: function(response) {
      $('#' + exchange + '-' + coin + '-price-bid').html(response.bid_price.toFixed(2));
      $('#' + exchange + '-' + coin + '-price-ask').html(response.ask_price.toFixed(2));
    },
    error: function() {
    }
  });
}

function refreshAllPrices() {
  refreshPrices('litecoin');
  refreshPrices('bitcoin');
  refreshPrices('ethereum');
}

$(document).on('turbolinks:load', function() {
  refreshAllPrices();
  setInterval(function() {
    refreshAllPrices();
  }, 1000 * 60 * 5);

  $('#refresh-litecoin-prices, #refresh-bitcoin-prices, #refresh-ethereum-prices').on('click', function() {
    buttonId = $(this).attr('id');
    coin = buttonId.match(new RegExp('refresh-' + "(.*)" + '-prices'))[1];
    refreshPrices(coin);
  });
});

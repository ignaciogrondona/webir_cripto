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
      createCoin(coin, 'bitstamp', data.last, new Date($.now()));
      $('#bitstamp-' + coin + '-price-bid').html(data.bid);
      $('#bitstamp-' + coin + '-price-ask').html(data.ask);
    },
    error: function() {
    }
  });


  $.ajax({
    url: bitfinexUrl,
    type: 'GET',
    dataType: 'json',
    success: function(data) {
      createCoin(coin, 'coinbase', data.last_price, new Date($.now()));
      $('#bitfinex-' + coin + '-price-bid').html(data.bid);
      $('#bitfinex-' + coin + '-price-ask').html(data.ask);
    },
    error: function() {
    }
  });

  $.ajax({
    url: coinbaseUrl,
    type: 'GET',
    dataType: 'json',
    success: function(data) {
      createCoin(coin, 'coinbase', data.data.amount, new Date($.now()));
      $('#coinbase-'+ coin +'-price-bid').html(data.bid);
      $('#coinbase-'+ coin +'-price-ask').html(data.ask);
    },
    error: function() {
    }
  });
}

function createCoin(coin, exchange, value, datetime) {
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
      value: value,
      datetime: datetime
    }
  }

  $.ajax({
    url: url,
    type: 'POST',
    dataType: 'json',
    data: data,
    success: function(response) {
      $('#' + exchange + '-' + coin + '-price').html(response.value);
    },
    error: function() {
    }
  });
}

function refreshAllPrices() {
  refreshPrices('dashboard');
  refreshPrices('litecoin');
  refreshPrices('bitcoin');
  refreshPrices('ethereum');
}

$(document).on('turbolinks:load', function() {
  refreshAllPrices();
  setInterval(function() {
    refreshAllPrices();
  }, 1000 * 60);


  $('#refresh-prices, #refresh-litecoin-prices, #refresh-bitcoin-prices, #refresh-ethereum-prices').on('click', function() {
    buttonId = $(this).attr('id');
    coin = buttonId.match(new RegExp('refresh-' + "(.*)" + '-prices'))[1];
    refreshPrices(coin);
  });

});

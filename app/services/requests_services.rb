class RequestsServices
  def initialize
  end

  def get_last_price(currency)
    get_last_price_bitstamp(currency)
    get_last_price_bitfinex(currency)
    get_last_price_coinbase(currency)
  end

  private

  def get_last_price_bitstamp(currency)
    exchange = Exchange.find_by(name: 'Bitstamp')
    case currency
    when 'bitcoin'
      symbol = 'btcusd'
      model = BitcoinPrice
    when 'litecoin'
      symbol = 'ltcusd'
      model = LitecoinPrice
    when 'ethereum'
      symbol = 'ethusd'
      model = EthereumPrice
    end
    response = HTTParty.get("https://www.bitstamp.net/api/v2/ticker/#{symbol}")
    return unless response.success?
    model.create(exchange_id: exchange.id, value: response['last'],
      datetime: DateTime.strptime(response['timestamp'],'%s'))
  end

  def get_last_price_bitfinex(currency)
    exchange = Exchange.find_by(name: 'Bitfinex')
    case currency
    when 'bitcoin'
      symbol = 'btcusd'
      model = BitcoinPrice
    when 'litecoin'
      symbol = 'ltcusd'
      model = LitecoinPrice
    when 'ethereum'
      symbol = 'ethusd'
      model = EthereumPrice
    end
    response = HTTParty.get("https://api.bitfinex.com/v1/pubticker/#{symbol}")
    return unless response.success?
    model.create(exchange_id: exchange.id, value: response['last_price'],
      datetime: DateTime.strptime(response['timestamp'],'%s'))
  end

  def get_last_price_coinbase(currency)
    exchange = Exchange.find_by(name: 'Coinbase')
    case currency
    when 'bitcoin'
      symbol = 'btc-usd'
      model = BitcoinPrice
    when 'litecoin'
      symbol = 'ltc-usd'
      model = LitecoinPrice
    when 'ethereum'
      symbol = 'eth-usd'
      model = EthereumPrice
    end
    response = HTTParty.get("https://api.coinbase.com/v2/prices/#{symbol}/spot")
    return unless response.success?
    model.create(exchange_id: exchange.id, value: response['data']['amount'],
      datetime: DateTime.now)
  end
end

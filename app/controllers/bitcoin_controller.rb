class BitcoinController < ApplicationController
  def index
    @prices = []
    Exchange.all.each do |exchange|
      line = { name: exchange.name, data: {} }
      exchange.bitcoin_prices.last(20).each do |coin|
        line[:data][coin.datetime.change(sec:0)] = coin.value
      end
      @prices.push(line)
    end
    @prices
  end

  def create
    bitcoin_price = BitcoinPrice.new(ethereum_params)
    if bitcoin_price.save
      render json: bitcoin_price.to_json
    else
      render json: bitcoin_price.errors.to_json
    end
  end

  private

  def ethereum_params
    params.require(:currency_price).permit(:exchange_id, :value, :datetime)
  end
end

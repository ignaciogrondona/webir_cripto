class EthereumController < ApplicationController
  def index
    @prices = []
    Exchange.all.each do |exchange|
      line = { name: exchange.name, data: {} }
      exchange.ethereum_prices.last(20).each do |coin|
        line[:data][coin.datetime.change(sec:0)] = coin.value
      end
      @prices.push(line)
    end
    @prices
  end

  def create
    ethereum_price = EthereumPrice.new(ethereum_params)
    if ethereum_price.save
      render json: ethereum_price.to_json
    else
      render json: ethereum_price.errors.to_json
    end
  end

  private

  def ethereum_params
    params.require(:currency_price).permit(:exchange_id, :value, :datetime)
  end
end

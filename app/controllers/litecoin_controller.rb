class LitecoinController < ApplicationController
  def index
    @prices = []
    Exchange.all.each do |exchange|
      line = { name: exchange.name, data: {} } 
      exchange.litecoin_prices.last(20).each do |coin|
        line[:data][coin.datetime.change(sec:0)] = coin.value
      end
      @prices.push(line)
    end
    @min = (@prices.map {|price| price[:data].values }.min.min * 0.998).truncate
    @max = (@prices.map {|price| price[:data].values }.max.max * 1.002).ceil
    @prices
  end

  def create
    litecoin = LitecoinPrice.new(ethereum_params)
    if litecoin.save
      render json: litecoin.to_json
    else
      render json: litecoin.errors.to_json
    end
  end

  private

  def ethereum_params
    params.require(:currency_price).permit(:exchange_id, :value, :datetime)
  end
end

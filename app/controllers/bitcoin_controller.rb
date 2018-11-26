class BitcoinController < ApplicationController
  def index
    @prices = []
    Exchange.all.each do |exchange|
      line_bid = { name: "#{exchange.name} bid_price", data: {} }
      line_ask = { name: "#{exchange.name} ask_price", data: {} }
      exchange.bitcoin_prices.last(20).each do |coin|
        line_bid[:data][coin.datetime.change(sec:0)] = coin.bid_price if coin.bid_price
        line_ask[:data][coin.datetime.change(sec:0)] = coin.ask_price if coin.ask_price
      end
      @prices.push(line_bid) unless line_bid[:data].empty?
      @prices.push(line_ask) unless line_ask[:data].empty?
    end
    @min = (@prices.map {|price| price[:data].values }.flatten.min * 0.998).truncate
    @max = (@prices.map {|price| price[:data].values }.flatten.max * 1.002).ceil
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
    params.require(:currency_price).permit(:exchange_id, :ask_price, :bid_price, :datetime)
  end
end

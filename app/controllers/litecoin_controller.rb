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
    @prices
  end
end

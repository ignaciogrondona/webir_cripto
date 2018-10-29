class BitcoinController < ApplicationController
  def index
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

class EthereumController < ApplicationController
  def index
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

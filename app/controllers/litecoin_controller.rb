class LitecoinController < ApplicationController
  def index
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

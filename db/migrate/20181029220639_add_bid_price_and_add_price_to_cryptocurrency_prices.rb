class AddBidPriceAndAddPriceToCryptocurrencyPrices < ActiveRecord::Migration[5.2]
  def change
    add_column :cryptocurrency_prices, :bid_price, :float
    add_column :cryptocurrency_prices, :ask_price, :float
  end
end

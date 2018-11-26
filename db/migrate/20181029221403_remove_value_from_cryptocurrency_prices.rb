class RemoveValueFromCryptocurrencyPrices < ActiveRecord::Migration[5.2]
  def change
    remove_column :cryptocurrency_prices, :value
  end
end

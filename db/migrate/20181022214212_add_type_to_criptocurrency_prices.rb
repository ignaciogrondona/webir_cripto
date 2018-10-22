class AddTypeToCriptocurrencyPrices < ActiveRecord::Migration[5.2]
  def change
    add_column :cryptocurrency_prices, :type, :string
  end
end

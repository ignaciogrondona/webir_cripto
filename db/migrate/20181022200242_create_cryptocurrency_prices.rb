class CreateCryptocurrencyPrices < ActiveRecord::Migration[5.2]
  def change
    create_table :cryptocurrency_prices do |t|
      t.references :exchange, foreign_key: true
      t.float :value
      t.datetime :datetime
    end
  end
end

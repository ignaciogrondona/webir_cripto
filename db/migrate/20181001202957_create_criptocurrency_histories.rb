class CreateCriptocurrencyHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :criptocurrency_histories do |t|
      t.string :name

      t.timestamps
    end
  end
end

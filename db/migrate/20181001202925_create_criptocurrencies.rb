class CreateCriptocurrencies < ActiveRecord::Migration[5.2]
  def change
    create_table :criptocurrencies do |t|
      t.string :name

      t.timestamps
    end
  end
end

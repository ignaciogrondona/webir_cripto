ActiveAdmin.register CryptocurrencyPrice do
  index do
    selectable_column
    id_column
    column :type
    column :exchange
    column :avg_price
    column :bid_price
    column :datetime
    actions
  end
end

ActiveAdmin.register CryptocurrencyPrice do
  permit_params :exchange, :value, :datetime

  action_item only: :index do
    link_to 'Reload', action: 'get_last_value'
  end

  collection_action :get_last_value do
    RequestsServices.new.get_last_price('all')
    redirect_to collection_path, notice: "Data reloaded successfully!"
  end

  index do
    selectable_column
    id_column
    column :type
    column :exchange
    column :value
    column :datetime
    actions
  end
end

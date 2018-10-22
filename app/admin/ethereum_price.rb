ActiveAdmin.register EthereumPrice do
  permit_params :exchange, :value, :datetime

  action_item only: :index do
    link_to 'Reload', action: 'get_last_value'
  end

  collection_action :get_last_value do
    RequestsServices.new.get_last_price('ethereum')
    redirect_to collection_path, notice: "Data reloaded successfully!"
  end
end

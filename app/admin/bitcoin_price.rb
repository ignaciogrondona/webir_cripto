ActiveAdmin.register BitcoinPrice do
  permit_params :exchange, :value, :datetime
end

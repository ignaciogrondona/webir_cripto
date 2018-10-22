class Exchange < ApplicationRecord
  has_many :bitcoin_prices
  has_many :litecoin_prices
  has_many :ethereum_prices

  validates :name, :api_url, presence: true
end

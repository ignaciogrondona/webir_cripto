class CryptocurrencyPrice < ApplicationRecord
  belongs_to :exchange

  validates :ask_price, :bid_price, :datetime, presence: true
end

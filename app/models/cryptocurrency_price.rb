class CryptocurrencyPrice < ApplicationRecord
  belongs_to :exchange

  validates :value, :datetime, presence: true
end

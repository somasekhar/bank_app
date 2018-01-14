class Tenure < ApplicationRecord
  belongs_to :bank

  validates :bank_id, :months, :rate, :minimum_amount, presence: true

end

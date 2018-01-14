class Bank < ApplicationRecord

  has_many :tenures

  validates :name, presence: true, uniqueness: true


end

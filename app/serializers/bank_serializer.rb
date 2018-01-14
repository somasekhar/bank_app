class BankSerializer < ActiveModel::Serializer
  self.root = false

  attributes :name
  has_many :tenures

end

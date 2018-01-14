class TenureSerializer < ActiveModel::Serializer
  attributes :months, :rate, :minimum_amount
end

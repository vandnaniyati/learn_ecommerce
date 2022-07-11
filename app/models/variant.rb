class Variant < ApplicationRecord
  has_many :reviews, as: :rating, dependent: :destroy

end

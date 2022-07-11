class Brand < ApplicationRecord
  has_many :reviews, as: :rating, dependent: :destroy

end

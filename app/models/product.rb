class Product < ApplicationRecord
  has_many :reviews, as: :rating, dependent: :destroy


  accepts_nested_attributes_for :reviews

end

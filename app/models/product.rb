class Product < ApplicationRecord

  has_many :reviews, as: :rating, dependent: :destroy
  has_many :variants
  self.per_page = 10
  WillPaginate.per_page = 10


  accepts_nested_attributes_for :reviews, :variants

end

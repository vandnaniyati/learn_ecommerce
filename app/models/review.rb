class Review < ApplicationRecord
  belongs_to :rating, polymorphic: true
  belongs_to :product, optional: true
end

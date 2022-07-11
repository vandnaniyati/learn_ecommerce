class Review < ApplicationRecord
  belongs_to :rating, polymorphic: true
end

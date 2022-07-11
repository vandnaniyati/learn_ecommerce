class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.text :description
      t.references :rating, polymorphic: true

      t.timestamps
    end
    add_column :reviews, :product_id, :integer
  end
end

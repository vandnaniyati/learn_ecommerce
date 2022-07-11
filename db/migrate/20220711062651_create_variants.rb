class CreateVariants < ActiveRecord::Migration[7.0]
  def change
    create_table :variants do |t|
      t.string :size
      t.integer :product_id

      t.timestamps
    end
  end
end

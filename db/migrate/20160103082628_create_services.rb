class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :title
      t.string :description
      t.integer :price
      t.string :delivery_time
      t.string :included_revisions
      t.integer :user_id
      t.string :user_name
      t.string :extra_delivery
      t.integer :extra_delivery_price
      t.integer :source_code_price
      t.integer :revision_price
      t.string :revision_additional
      t.integer :stock_image_price
      t.references :category, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true


      t.timestamps null: false
    end
  end
end

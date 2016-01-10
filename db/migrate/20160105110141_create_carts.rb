class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.string :user_id
      t.string :service_id
      t.string :service_name
      t.string :service_owner
      t.string :owner_name
      t.references :service, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

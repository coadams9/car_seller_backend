class CreateSellerCars < ActiveRecord::Migration[5.2]
  def change
    create_table :seller_cars do |t|
      t.references :car, foreign_key: true
      t.references :seller,  foreign_key: true

      t.timestamps
    end
  end
end

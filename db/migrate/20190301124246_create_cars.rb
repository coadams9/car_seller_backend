class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :make
      t.string :modelMake
      t.string :year
      t.string :color
      t.string :image
      t.string :description
      t.string :price
      t.boolean :favorite

      t.timestamps
    end
  end
end

class CreateUserCars < ActiveRecord::Migration[5.2]
  def change
    create_table :user_cars do |t|
      t.references :car, foreign_key: true
      t.references :user,  foreign_key: true

      t.timestamps
    end
  end
end

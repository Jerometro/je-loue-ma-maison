class CreateHouses < ActiveRecord::Migration[6.0]
  def change
    create_table :houses do |t|
      t.string :address
      t.integer :price_per_day
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end

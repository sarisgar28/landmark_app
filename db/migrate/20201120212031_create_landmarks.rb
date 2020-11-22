class CreateLandmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :landmarks do |t|
      t.string :location 
      t.integer :year_built
      t.string :architect 
      t.integer :user_id
      t.integer :city_id 
      t.timestamps
    end
  end
end

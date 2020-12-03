class CreateLandmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :landmarks do |t|
      t.string :name
      t.string :city
      t.string :country 
      t.text :description 
      t.timestamps
    end
  end
end

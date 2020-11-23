class CreateLandmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :landmarks do |t|
      t.string :name
      t.string :city
      t.string :country 
      t.boolean :ancient 
      t.boolean :modern
      t.integer :user_id
      t.integer :review_id
      t.timestamps
    end
  end
end

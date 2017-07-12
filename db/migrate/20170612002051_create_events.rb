class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      
      t.string :title
      t.string :date
      t.string :schedule
      t.string :description
      t.string :image
      t.string :role
      t.references :user


      t.timestamps null: false
    end
  end
end

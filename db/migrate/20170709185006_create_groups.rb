class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      
      t.string :title
      t.string :schedule
      t.string :description
      t.string :image
      t.string :role
      t.string :size
      t.string :teste
      t.references :user

      
      t.timestamps null: false
    end
  end
end

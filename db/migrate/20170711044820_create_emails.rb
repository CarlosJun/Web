class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :address
      t.references :group
      t.timestamps null: false
    end
  end
end

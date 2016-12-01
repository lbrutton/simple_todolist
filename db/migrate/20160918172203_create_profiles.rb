class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.belongs_to :user, index: true
      t.string :gender
      t.integer :birth_year
      t.string :first_name
      t.string :last_name

      t.timestamps null: false
    end
  end
end

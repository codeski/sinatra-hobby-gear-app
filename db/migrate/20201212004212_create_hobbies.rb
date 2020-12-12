class CreateHobbies < ActiveRecord::Migration
  def change
    create_table :hobbies do |h|
      h.string :name
      h.string :season
      h.integer :user_id
      h.timestamps null: false
    end
  end
end

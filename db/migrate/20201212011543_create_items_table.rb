class CreateItemsTable < ActiveRecord::Migration
  def change
    create_table :items do |i|
      i.string :name
      i.integer :year
      i.string :company
      i.integer :hobby_id
      i.timestamps null: false
    end
  end
end

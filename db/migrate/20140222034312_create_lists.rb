class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.references :item, index: true
      t.references :user, index: true
      t.string :name

      t.timestamps
    end
  end
end

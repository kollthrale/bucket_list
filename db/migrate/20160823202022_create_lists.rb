class CreateLists < ActiveRecord::Migration[5.0]
  def change
    create_table :lists do |t|
      t.string :title
      t.string :place
      t.text :description

      t.timestamps
    end
  end
end

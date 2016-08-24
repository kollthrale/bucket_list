class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description
      t.boolean :completed, default: false
      t.belongs_to :list

      t.timestamps
    end
  end
end

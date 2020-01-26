class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.references :country, null: false, foreign_key: true
      t.numeric :price

      t.timestamps
    end
  end
end

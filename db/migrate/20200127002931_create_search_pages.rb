class CreateSearchPages < ActiveRecord::Migration[6.0]
  def change
    create_table :search_pages do |t|
      t.string :title
      t.text :description
      t.string :country
      t.numeric :price
      t.text :tags

      t.timestamps
    end
  end
end

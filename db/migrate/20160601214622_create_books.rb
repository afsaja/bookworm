class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :image_url
      t.integer :author_id
      t.text :description
      t.integer :length
      t.integer :year

      t.timestamps

    end
  end
end

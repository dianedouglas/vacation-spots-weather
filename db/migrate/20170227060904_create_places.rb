class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :location
      t.string :image_url
      t.string :visit_length
      t.text :favorite_memory

      t.timestamps
    end
  end
end

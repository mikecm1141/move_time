class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.string :geo_id

      t.timestamps
    end
  end
end

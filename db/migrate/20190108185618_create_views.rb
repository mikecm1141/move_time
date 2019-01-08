class CreateViews < ActiveRecord::Migration[5.2]
  def change
    create_table :views do |t|
      t.references :user, foreign_key: true
      t.string :geo_id

      t.timestamps
    end
  end
end

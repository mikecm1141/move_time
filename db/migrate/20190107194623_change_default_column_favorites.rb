class ChangeDefaultColumnFavorites < ActiveRecord::Migration[5.2]
  def change
    change_column :favorites, :active, :boolean, default: true
  end
end

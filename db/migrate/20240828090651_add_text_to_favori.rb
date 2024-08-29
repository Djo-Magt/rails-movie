class AddTextToFavori < ActiveRecord::Migration[7.1]
  def change
    add_column :favoris, :text, :string
  end
end

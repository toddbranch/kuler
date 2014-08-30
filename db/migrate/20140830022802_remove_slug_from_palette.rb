class RemoveSlugFromPalette < ActiveRecord::Migration
  def change
    remove_column :palettes, :slug, :string
  end
end

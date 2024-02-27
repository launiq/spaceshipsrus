class AddColumnImageUrlToSpacaship < ActiveRecord::Migration[7.1]
  def change
    add_column :spaceships, :image_url, :string
  end
end

class AddPageTitleToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :page_title, :string
  end
end

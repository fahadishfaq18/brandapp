class AddCollectionTitleToVendor < ActiveRecord::Migration[5.2]
  def change
    add_column :vendors, :collection_title, :string
  end
end

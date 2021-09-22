class AddCollectionIdToVendor < ActiveRecord::Migration[5.2]
  def change
    add_column :vendors, :collection_id, :string
  end
end

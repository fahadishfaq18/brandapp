class CreateSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :settings do |t|
      t.string :heading_color
      t.string :layout_style
      t.string :image_width
      t.string :page_ui_option
      t.string :heading_size
      t.string :brand_color
      t.string :brand_size
      t.integer :shop_id

      t.timestamps
    end
  end
end

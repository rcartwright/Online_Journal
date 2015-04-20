class CreateStyles < ActiveRecord::Migration
  def change
    create_table :styles do |t|
      t.string :layout
      t.string :header_image
      t.string :color_theme

      t.timestamps null: false
    end
  end
end

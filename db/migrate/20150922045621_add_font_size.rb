class AddFontSize < ActiveRecord::Migration
  def change
  	add_column :styles, :font_size, :integer, :default => "14px"
  end
end

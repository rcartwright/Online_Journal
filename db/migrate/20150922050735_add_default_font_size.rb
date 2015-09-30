class AddDefaultFontSize < ActiveRecord::Migration
  def change
  	change_column :styles, :font_size, :character, :default => "14px"
  end
end

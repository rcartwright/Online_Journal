class AddDefaultValueToStylesColorTheme < ActiveRecord::Migration
  def change
  	change_column :styles, :color_theme, :string, :default => "sky_blue"
  end
end

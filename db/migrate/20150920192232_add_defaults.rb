class AddDefaults < ActiveRecord::Migration
  def change
  	change_column :styles, :layout, :string, :default => "flat_layout"
  	change_column :styles, :color_theme, :string, :default => "blue_theme"
  end
end

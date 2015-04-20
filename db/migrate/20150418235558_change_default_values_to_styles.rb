class ChangeDefaultValuesToStyles < ActiveRecord::Migration
  def change
  	change_column :styles, :layout, :string, :default => 'Flat_layout'
  	change_column :styles, :color_theme, :string, :default => 'Cool_blue'
  end
end

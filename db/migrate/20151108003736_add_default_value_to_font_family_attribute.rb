class AddDefaultValueToFontFamilyAttribute < ActiveRecord::Migration
  def change
  	change_column :styles, :font_family, :string, :default => "rachels-pick"
  end
end

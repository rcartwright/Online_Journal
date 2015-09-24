class AddFontFamilyToStyles < ActiveRecord::Migration
  def change
    add_column :styles, :font_family, :string, :default => "nunito"
  end
end

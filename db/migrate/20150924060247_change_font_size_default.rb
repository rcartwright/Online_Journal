class ChangeFontSizeDefault < ActiveRecord::Migration
  def change
  	change_column :styles, :font_size, :string, :default => "medium-font"
  end
end

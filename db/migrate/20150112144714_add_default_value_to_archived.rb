class AddDefaultValueToArchived < ActiveRecord::Migration
  def change
  	change_column_default :episodes, :archived, false
  end
end

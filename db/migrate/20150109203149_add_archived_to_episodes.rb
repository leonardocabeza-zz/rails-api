class AddArchivedToEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.string :title
      t.string :episode
      t.text :description
      t.integer :archived
      t.timestamps null: false
    end
  end
end

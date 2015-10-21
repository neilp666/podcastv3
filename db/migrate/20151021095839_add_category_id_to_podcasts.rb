class AddCategoryIdToPodcasts < ActiveRecord::Migration
  def change
    add_column :podcasts, :category_id, :integer
  end
end

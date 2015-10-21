class AddUserIdToPodcasts < ActiveRecord::Migration
  def change
    add_column :podcasts, :user_id, :integer
  end
end

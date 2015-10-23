class AddPodcastIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :podcast_id, :integer
  end
end

class AddAttachmentPodcastImgToPodcasts < ActiveRecord::Migration
  def self.up
    change_table :podcasts do |t|
      t.attachment :podcast_img
    end
  end

  def self.down
    remove_attachment :podcasts, :podcast_img
  end
end

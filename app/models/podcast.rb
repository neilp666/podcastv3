class Podcast < ActiveRecord::Base

  belongs_to :user
  belongs_to :category



  has_attached_file :podcast_img, styles: { :podcast_index => "250x350>", :podcast_show => "325x475>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :podcast_img, content_type: /\Aimage\/.*\Z/
end


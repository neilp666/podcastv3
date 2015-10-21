class Category < ActiveRecord::Base

  has_many :podcasts
end

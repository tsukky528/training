class Relationship < ActiveRecord::Base
  belongs_to :user, class_name: "User"
  belongs_to :like_movie, class_name: "Training"
  validates :user_id, presence: true
  validates :like_movie_id, presence: true
end

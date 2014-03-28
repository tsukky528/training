class Training < ActiveRecord::Base
  has_many :relationships, foreign_key:"like_movie_id", dependent: :destroy

  mount_uploader :movie, MovieUploader

  validate do
  	break if movie? || youtube?
  	errors.add(:movie, "どちらか動画が必要です。")
  	errors.add(:youtube, "どちらか動画が必要です。")
  end
  
  validates :explain, :muscle, presence: true


end

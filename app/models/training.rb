class Training < ActiveRecord::Base

  mount_uploader :movie, MovieUploader

  validate do
  	break if movie? || youtube?
  	errors.add(:youtube, "どちらか動画が必要です。")
  end
  validates :explain, :muscle, presence: true
end

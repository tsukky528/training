class User < ActiveRecord::Base
  has_many :relationships, foreign_key: "user_id", dependent: :destroy

  has_many :reverse_relationships, foreign_key: "like_movie_id", class_name: "Relationship", dependent: :destroy
  has_many :users, through: :reverse_relationships, source: :user
  has_many :trainings, through: :relationships, source: :like_movie

  before_create :create_remember_token
  validates :name, presence: true, length: { maximum: 20 }

  has_secure_password

  validates :password, length: { minimum: 4 }

  def like?(like_training)
    relationships.find_by(like_movie_id: like_training.id)
  end

  def like!(like_training)
    relationships.create!(like_movie_id: like_training.id)
  end

  def unlike!(like_training)
    relationships.find_by(like_movie_id: like_training.id).destroy
  end


  
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end

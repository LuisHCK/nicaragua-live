class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_one :profile,  dependent: :destroy

	after_create :create_profile

  has_many :hearts, dependent: :destroy
  has_many :posts, through: :hearts

  has_many :comments
  has_many :event_comments

  has_many :events
  has_many :surveys
  # creates a new heart row with post_id and user_id
  def heart!(post)
    self.hearts.create!(post_id: post.id)
  end

  # destroys a heart with matching post_id and user_id
  def unheart!(post)
    heart = self.hearts.find_by_post_id(post.id)
    heart.destroy!
  end

  # returns true of false if a post is hearted by user
  def heart?(post)
    self.hearts.find_by_post_id(post.id)
end
end

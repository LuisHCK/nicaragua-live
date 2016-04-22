class Client < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :clientprofile,  dependent: :destroy

  after_create :create_clientprofile

  has_many :hearts, dependent: :destroy
  has_many :posts, through: :hearts, dependent: :destroy

  has_many :comments

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

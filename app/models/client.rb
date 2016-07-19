class Client < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :first_name, presence:

  has_surveys
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :clientprofile

  after_create :create_clientprofile

  has_many :hearts
  has_many :posts, through: :hearts, dependent: :destroy

  has_many :comments
  has_many :event_comments
  has_many :items
  has_many :reviews, dependent: :destroy
  has_many :valorations
  has_many :coupon_redemptions

  has_many :follows
  has_many :profiles, through: :follows, dependent: :destroy


  # creates a new heart row with post_id and user_id
  def heart!(post)
    self.hearts.create(post_id: post.id, client_id: :id)
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

  #returns true or dalse if the client already reviewed profile
  def reviewed?(profile)
    self.reviews.find_by_profile_id(profile.id)
  end

  #returns true or dalse if the client already reviewed profile
  def valorated?(valoration)
    self.valorations.find_by_valorarion_id(valoration.id)
  end

  ##Adding Followin methods
    def follow_user
      if current_client.follow!(@profile)
        format.html { redirect_to @profile, notice: 'Has seguido a' }
      end
    end

    def follow!(profile)
      self.follows.create(profile_id: profile.id)
    end

    def unfollow!(profile)
      follow = self.follows.find_by profile_id:(profile.id)
      follow.destroy!
    end

    def follow?(profile)
      self.follows.find_by profile_id:(profile.id)
    end

  #client has redeemed?
  def redeemed?(coupon)
    self.coupon_redemptions.find_by coupon_id:(coupon.id)
  end

end

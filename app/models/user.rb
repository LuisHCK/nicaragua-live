class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, omniauth_providers:[:facebook]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    user.name = auth.info.name   # assuming the user model has a name
    user.last_name = auth.info.last_name # assuming the user model has an image
  end
end

def self.new_with_session(params, session)
  super.tap do |user|
    if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
      user.email = data["email"] if user.email.blank?
    end
  end
end

has_one :profile,  dependent: :destroy
has_one :clientprofile, dependent: :destroy

has_many :hearts, dependent: :destroy
has_many :posts, through: :hearts
has_one :partner, dependent: :destroy

has_many :comments
has_many :event_comments

has_many :events
has_many :surveys
has_many :coupons
has_many :follows
has_many :profiles, through: :follows, dependent: :destroy

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

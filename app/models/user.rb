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
has_many :reviews

has_many :comments
has_many :event_comments

has_many :events
has_many :surveys
has_many :coupons
has_many :follows
has_many :profiles, through: :follows, dependent: :destroy
has_many :offer_saves, dependent: :destroy


end

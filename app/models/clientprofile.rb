class Clientprofile < ActiveRecord::Base
  belongs_to :client, dependent: :destroy
  has_attached_file :cover, styles: {card: "600x600#"}, dependent: :destroy
  has_attached_file :avatar, styles: {mini: "400x400#"}, dependent: :destroy
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/ , presence: true
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/ , presence: true

  has_many :follows, dependent: :destroy
  has_many :profiles, through: :follows, dependent: :destroy

  has_many :clients, through: :follows, dependent: :destroy
  has_many :event_comments

  ##Adding Followin methods
    def follow_user
      if @clientprofile.follow!(@profile)
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
end

class Profile < ActiveRecord::Base
  include AASM

	aasm column: 'aasm_campaign' do
		state :noone, initial: true
		state :one_day
		state :seven_days
		state :fifteen_days

		event :promove_one_day do
			transitions from: :noone, to: :one_day
		end

		event :promove_seven_days do
			transitions from: [:noone,:one_day], to: :seven_days
		end

		event :promove_fifteen_days do
			transitions from: [:noone,:one_day,:seven_days], to: :fifteen_days
		end

		event :end_promotion do
			transitions form: [:one_day,:seven_days,:fifteen_days], to: :noone
		end

	end

	aasm column: 'aasm_state' do
		state :free, initial: true
		state :premium
		state :banned

		event :upgrade do
			transitions from: :free, to: :premium
		end

		event :downgrade do
			transitions from: :premium, to: :free
		end

		event :ban do
			transitions from: [:premium, :free], to: :banned
		end

		event :unban do
			transitions from: :banned, to: :free
		end

	end

	searchkick searchable: [:name,:body]
	has_many :posts, dependent: :destroy
	has_many :offers, dependent: :destroy
	has_many :hearts

	has_attached_file :cover,
	styles: { thumb: ["64x64#", :jpg],
		original: ['600x600#', :jpg] },
		convert_options: { thumb: "-quality 75 -strip",
			original: "-quality 95 -strip" },
			url: "/system/covers/:id/:style/cover.jpg",
			path: ":rails_root/public/system/covers/:id/:style/cover.jpg", default_url: "cover-default.png"

  has_attached_file :avatar, styles: { thumb: ["80x80#", :jpg],
    url: "/system/avatars/:id/:style/avatar.jpg",
                original: ['300x300#', :jpg] },
                convert_options: { thumb: "-quality 85 -strip",
                                            original: "-quality 85 -strip" }, default_url: "icon-user-default.png"

				validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/ , presence: true
				validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/ , presence: true

				has_many :follows, dependent: :destroy
#	has_many :clientprofiles, through: :follows
has_many :reviews
end

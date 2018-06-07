class Tweet < ApplicationRecord
	belongs_to :user, optional: true
	validates :message, presence: true
	validates :message, length: {maximum: 140, too_long: "A tweet is only 140 characters max. Every tweety knows that!"}
end

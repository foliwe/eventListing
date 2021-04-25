class User < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  has_secure_password

  validates :name , presence: true
  validates :email, format: {with: /\S+@\S/},
                            uniqueness: {case_senitive: false}

  has_many :registrations, dependent: :destroy
  has_many :likes , dependent: :destroy

  has_many :liked_events, through: :likes, source: :event
                            
end

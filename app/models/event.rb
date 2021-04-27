class Event < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  validates :location, length: { minimum: 5, maximum: 100}
  validates :description, length: { minimum: 10, maximum: 600 }
  validates :price , presence: true
  validates :capacity , numericality: 
                        {only_integer: true, greater_than_or_equal_to: 0}
  validates :name,length: {minimum: 2 , maximum: 200}

  has_many :registrations, dependent: :destroy

  has_many :event_categories
  has_many :categories , through: :event_categories

  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes ,source: :user


  def free?
    price == 0 || price == ''
  end

   def available_spot
      return(capacity - registrations.size)
   end

  def sold_out
    (capacity - registrations.size).zero? || registrations.map(&:user_id ).include?(likers)
  end

  
 

# Scopes
 scope :upcoming, -> {where("starts_at > ?", Time.now).order("starts_at")}
 scope :free, -> {upcoming.where(price: 0 ).order("name")}
 scope :past, -> {where("starts_at < ?", Time.now).order("starts_at desc")}
 scope :recent, -> (max=3){past.limit(max).order("starts_at")}
 scope :close_by, -> (similar_events){upcoming.where("location = ?",(similar_events)).order("starts_at")}
 
end

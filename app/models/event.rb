class Event < ApplicationRecord
  validates :location, length: { minimum: 5, maximum: 100}
  validates :description, length: { minimum: 10, maximum: 600 }
  validates :price , presence: true
  validates :capacity , numericality: 
                        {only_integer: true, greater_than_or_equal_to: 0}
  validates :name,length: {minimum: 2 , maximum: 200}

  has_many :registrations, dependent: :destroy

  # def self.upcoming_events
  #   where("starts_at > ?", Time.now).order("starts_at")
  # end
  def free?
    price == 0 || price == ''
  end

   def available_spot
      return(capacity - registrations.size)
   end

  def sold_out
    (capacity - registrations.size).zero?
  end

 scope :upcoming_events, -> {where("starts_at > ?", Time.now).order("starts_at")}
 scope :events_close_by, -> (current_event){where("location == ?",(current_event)).order("starts_at")}
end

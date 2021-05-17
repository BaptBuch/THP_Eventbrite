class Event < ApplicationRecord
  has_many :attendances
  has_many :users, through: :attendances
  balongs_to :
  
  validates :start_date,
    presence: true,
    :is_past
    #impossible de créer ou modifier un événement dans le passé

  validates :duration,
    presence: true,
    numericality: { greater_than: 0}
    :is_a_multiple_of_5?
    #doit être un multiple de 5, et est strictement positif

  validates :title,
    presence: true,
    length: { in: 5..140 }

  validates :description, 
    presence: true, 
    length: { in: 20..1000 }

  validates :price,
    presence: true,
    value: {in: 1..1000}
  
  validates :location, presence: true

  def is_past
    if :start_date.past?
      errors.add(:start_date, "La date de début ne peut pas être dans le passée")
    end
  end

  def is_a_multiple_of_5
    if :duration%5 != 0
      errors.add(:duration, "La durée doit être un multiple de 5")
    end
  end

end

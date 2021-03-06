class User < ApplicationRecord
  has_many :events, foreign_key: 'administrator_id', class_name: 'Event'
  has_many :attendances
  has_many :events, through: :attendances
end

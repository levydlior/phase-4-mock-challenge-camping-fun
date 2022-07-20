class Signup < ApplicationRecord
  belongs_to :camper
  belongs_to :activity

  validates :time, numericality: {greater_than: 0, less_than: 24} 
  validates :activity_id, presence: true
  validates :camper_id, presence: true
end

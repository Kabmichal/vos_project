class Animal < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :name, presence: true, length: { maximum: 40 }
  validates :user_id, presence: true
  has_many :special_situations
  has_many :terrarium_enviroments
  has_many :animal_foods
end


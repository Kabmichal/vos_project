class Animal < ApplicationRecord
  belongs_to :user
  belongs_to :animal_type
  has_many :special_situations
  has_many :terrarium_enviroments
  has_many :animal_foods
end


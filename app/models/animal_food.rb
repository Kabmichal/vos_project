class AnimalFood < ApplicationRecord
  belongs_to :animal
  default_scope -> {order(created_at: :desc)}
  validates :animal_id, presence: true
  validates :count, presence: true
  validates :time, presence: true
  validates :food_id, presence: true
end

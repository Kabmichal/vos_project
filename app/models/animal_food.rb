class AnimalFood < ApplicationRecord
  default_scope -> { order(created_at: :desc)}
  belongs_to :food
  belongs_to :animal
end

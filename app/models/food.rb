class Food < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :name, presence: true, length: { maximum: 40 }
  validates :calories, presence: true
  validates :user_id, presence: true
end

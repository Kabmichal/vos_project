class Animal < ApplicationRecord
  belongs_to :user
  belongs_to :animal_type
  default_scope -> { order(created_at: :desc) }
  validates :name, presence: true, length: { maximum: 40 }
  validates :user_id, presence: true
  validates :animal_type_id, presence: true
  has_many :special_situations
  has_many :terrarium_enviroments
  has_many :animal_foods

  def self.search(search)
    where("name LIKE ?","%#{search}%")
  end
end


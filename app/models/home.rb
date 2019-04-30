class Home < ApplicationRecord
  belongs_to :user
  has_many :home_enviroments
end

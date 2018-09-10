class User < ApplicationRecord
  has_secure_password

  belongs_to :team
  has_many :teams
  has_many :users, through: :teams
  has_many :lists
  has_many :tasks, through: :lists

end

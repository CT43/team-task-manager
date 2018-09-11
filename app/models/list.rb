class List < ApplicationRecord
  belongs_to :user
  belongs_to :team, required: false
  has_many :tasks
   accepts_nested_attributes_for :tasks

  validates :name, presence: true
end

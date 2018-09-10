class List < ApplicationRecord
  belongs_to :user
  belongs_to :team
  has_many :tasks
   accepts_nested_attributes_for :tasks
end

class Task < ApplicationRecord
  belongs_to :list

  def self.tasks_to_complete
    where("completed == 0")
  end


end

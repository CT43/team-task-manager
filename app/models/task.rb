class Task < ApplicationRecord
  belongs_to :list

  def self.tasks_completed
    where("completed == 1")
  end

  def task_team_name
    self.list.user.team.name
  end

end

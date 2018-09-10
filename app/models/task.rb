class Task < ApplicationRecord
  belongs_to :list

  def update
    binding.pry
  end
end

class Task < ActiveRecord::Base

  belongs_to :task_list
  validates_presence_of :description

  scope :incomplete, -> { where(completed: false) }

  def param_parts
    [task_list, self.id]
  end

end
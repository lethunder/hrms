class Project < ActiveRecord::Base
  include ChangesTracker

  has_many :project_notes

  STATUSES = ['active', 'finished']

  validates :name, :description, :started_at, :status, presence: true
  validates :status, inclusion: { in: STATUSES }

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "created_by_name", "description", "id", "id_value", "name", "project_notes_count", "started_at", "status", "updated_at", "updated_by_name"]
  end
end

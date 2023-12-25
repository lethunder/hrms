class Vacancy < ActiveRecord::Base
  include ChangesTracker

  STATUSES = %w(open closed)

  validates :project, :role, :description, presence: true
  validates :tag, uniqueness: { case_sensitive: false },
    format: {
      with: /\A[a-z0-9\-]+\Z/,
      message: 'format is invalid, only a-z, 0-9 and "-" characters allowed'
    }
  validates :status, inclusion: { in: STATUSES }

  after_commit :create_tag, on: :create

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "created_by_name", "description", "id", "id_value", "project", "role", "status", "tag", "updated_at", "updated_by_name"]
  end

  private

  def create_tag
    return if ActsAsTaggableOn::Tag.find_by_name(self.tag).present?
    ActsAsTaggableOn::Tag.create(name: self.tag)
  end
end

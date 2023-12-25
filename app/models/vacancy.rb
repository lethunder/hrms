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

  private

  def create_tag
    return if ActsAsTaggableOn::Tag.find_by_name(self.tag).present?
    ActsAsTaggableOn::Tag.create(name: self.tag)
  end
end

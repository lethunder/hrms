class Expense < ActiveRecord::Base
  include ChangesTracker

  self.inheritance_column = nil

  TYPES = ['Business Trip', 'Conference', 'Other']

  belongs_to :person, touch: true

  validates :person, :recorded_on, :notes, presence: true
  validates :type, inclusion: { in: TYPES }
  validates :amount, numericality: { only_integer: true, greater_than: 0 }

  validate :recorded_on_greater_or_equal_person_start_date

  def self.ransackable_attributes(auth_object = nil)
    ["amount", "created_at", "created_by_name", "id", "id_value", "notes", "person_id", "recorded_on", "type", "updated_at", "updated_by_name"]
  end
  private

  def recorded_on_greater_or_equal_person_start_date
    return unless person&.start_date && recorded_on
    return if recorded_on > person.start_date
    errors.add(:recorded_on, 'should be later than person start_date')
  end
end

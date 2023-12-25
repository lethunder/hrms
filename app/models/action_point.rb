class ActionPoint < ActiveRecord::Base
  include ChangesTracker

  self.inheritance_column = nil

  belongs_to :person, counter_cache: true, touch: true

  validates :person, :value, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "created_by_name", "id", "id_value", "is_completed", "perform_on", "person_id", "updated_at", "updated_by_name", "value"]
  end
end

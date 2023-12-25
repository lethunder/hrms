class User < ActiveRecord::Base
  include ChangesTracker

  devise :database_authenticatable, :recoverable, :validatable

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "created_by_name", "email", "employee_notifications_enabled", "encrypted_password", "has_access_to_dayoffs", "has_access_to_events", "has_access_to_expenses", "has_access_to_finances", "has_access_to_performance", "has_access_to_users", "hide_statuses", "hide_tags", "id", "id_value", "notifications_enabled", "reset_password_sent_at", "reset_password_token", "updated_at", "updated_by_name"]
  end
end

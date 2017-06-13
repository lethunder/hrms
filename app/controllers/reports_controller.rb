class ReportsController < ApplicationController
  def index
  end

  def by_status
  end

  def by_technology
    respond_to do |format|
      format.html
      format.csv do
        require 'csv'

        people = Person.not_deleted.accessible_by(current_ability).where(primary_tech: params[:primary_tech])

        send_data(CSV.generate do |csv|
          csv << [
            'Name',
            'HR Status',
            'City',
            'Email',
            'Skype',
            'Phone',
            'Notes'
          ]
          people.each do |item|
            notes = item.notes.accessible_by(current_ability).order(updated_at: :desc).map do |note|
              if note.type.in?(current_user.accessible_note_types) || (!note.type.in?(current_user.accessible_note_types) && current_user.has_access_to_finances?)
                [
                  note.created_at.strftime(t(:day)),
                  note.value
                ].join("\r\n".html_safe)
              end
            end.join("\r\n---------------\r\n".html_safe)
            csv << [
              item.name,
              item.status,
              item.city,
              item.email,
              item.skype,
              item.phone,
              notes
            ]
          end
        end, filename: "#{params[:primary_tech].underscore}.csv")
      end
    end
  end

  def current_employees_table
    @people = Person.not_deleted.accessible_by(current_ability)
      .where(status: Person::EMPLOYEE_STATUSES)
      .order(:status, :name)
  end

  def people_with_similar_name
    @people = []
    previous_ids = []
    Person.not_deleted.accessible_by(current_ability).find_each(batch_size: 50) do |person|
      similars = Person.not_deleted.accessible_by(current_ability)
        .where('id NOT IN (?)', [person.id] + previous_ids)
        .where("(lower(name) ILIKE ?)
          OR (email IS NOT NULL AND email != '' AND email ILIKE ?)
          OR (phone IS NOT NULL AND phone != '' AND phone ILIKE ?)
          OR (skype IS NOT NULL AND skype != '' AND skype ILIKE ?)
          OR (linkedin IS NOT NULL AND linkedin != '' AND linkedin ILIKE ?)",
          "%#{person.name&.downcase&.strip}%",
          "%#{person.email&.strip&.presence || '#invalid#'}%",
          "%#{person.phone&.strip&.presence || '#invalid#'}%",
          "%#{person.skype&.strip&.presence || '#invalid#'}%",
          "%#{person.linkedin&.strip&.presence || '#invalid#'}%")

      if similars.exists?
        @people << {
          person: person,
          similars: similars
        }
        previous_ids += (similars.pluck(:id) + [person.id])
      end
    end
  end

  def historical_data
    @data = HistoricalDataCollector.new.perform
  end

  def employees
    @people = Person.not_deleted.accessible_by(current_ability)
                .where(status: 'Hired')
                .order(:status, :name)
  end
end

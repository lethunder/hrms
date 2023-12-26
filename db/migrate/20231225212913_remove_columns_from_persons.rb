class RemoveColumnsFromPersons < ActiveRecord::Migration[7.1]
  def change
     remove_column :people, :photo_id
     remove_column :people, :photo_size
     remove_column :people, :photo_content_type
     remove_column :people, :photo_filename
     remove_column :people, :attachments_count
  end
end

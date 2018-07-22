class AddPositionToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :position, :integer
  end
end

class AddBadgeToEducationProgram < ActiveRecord::Migration[5.2]
  def change
    add_column :education_programs, :badge, :text
  end
end

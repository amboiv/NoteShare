class AddAcademicDegreeToEducationProgram < ActiveRecord::Migration[5.2]
  def change
    add_column :education_programs, :education_degree, :integer, default: 0
  end
end

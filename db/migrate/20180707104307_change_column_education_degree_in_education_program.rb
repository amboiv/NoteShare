class ChangeColumnEducationDegreeInEducationProgram < ActiveRecord::Migration[5.2]
  def change
    rename_column :education_programs, :education_degree, :academic_degree
  end
end

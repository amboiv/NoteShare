class AddEducationProgramToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :education_program, foreign_key: true
  end
end

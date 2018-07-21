class CreateJoinTableCourseEducationProgram < ActiveRecord::Migration[5.2]
  def change
    create_join_table :courses, :education_programs do |t|
      # t.index [:course_id, :education_program_id]
      t.index [:education_program_id, :course_id], {name: "index_courses_eps_on_ep_id_and_course_id"}
    end
  end
end

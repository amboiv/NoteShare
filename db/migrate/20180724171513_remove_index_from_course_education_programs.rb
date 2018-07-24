class RemoveIndexFromCourseEducationPrograms < ActiveRecord::Migration[5.2]
  def change
    remove_index :course_education_programs, name: "index_courses_eps_on_ep_id_and_course_id"
  end
end

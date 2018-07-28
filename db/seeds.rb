# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



number_of_courses = 6
number_of_notes = 30
number_of_lectures = 12
number_of_students = 3

education_program_titles = ["Programmering", "Interaktivt design", "E-business"]
number_of_education_programs = education_program_titles.length

number_of_education_programs.times do |education_program|
    EducationProgram.create!(
        title: education_program_titles[education_program],
        badge: "https://placeholdit.co//i/50x50"
    )
end

puts "#{number_of_education_programs} education program created"

number_of_courses.times do |course|
    c = Course.create!(
        name: "Course number #{course}",
        code: "STUD#{course}",
        credits: 7.5,
        description: "This course can be taken at WOACT \n Curriculum: - Lorem ipsum"     
    )
    c.course_education_programs.create(education_program_id: 1) 
end

puts "#{number_of_courses} courses created"

puts "#{number_of_courses} course_to_eps created"

number_of_students.times do |student|
    User.create!(
        email: "student#{student}@student.com",
        password: "password",
        name: "Student #{student}",
        roles: "student",
        education_program_id: 1
    )
end

puts "#{number_of_students} students created"

User.create!(
    email: "instructor@instructor.com",
    password: "password",
    name: "Instructor Green",
    roles: "instructor",
    education_program_id: 1
)
puts "Instructor created"

number_of_courses.times do |course|
    number_of_lectures.times do |lecture|
        Lecture.create!(
            title: "lecture #{lecture + 1 }",
            date: (7 * lecture).days.from_now,
            course_id: Course.find(course + 1).id        
        )
    end
end

puts "#{number_of_lectures} lectures in each course created"

number_of_notes.times do |note|
    Note.create!(
        title: "Note from lecture at #{Date.current}",
        body: "Lorem ipsum dolor sit amet, 
            consectetur adipiscing elit, 
            sed do eiusmod tempor incididunt ut 
            labore et dolore magna aliqua. 
            Ut enim ad minim veniam, 
            quis nostrud exercitation ullamco 
            laboris nisi ut aliquip ex ea commodo 
            consequat. Duis aute irure dolor in 
            reprehenderit in voluptate velit esse 
            cillum dolore eu fugiat nulla pariatur. 
            Excepteur sint occaecat cupidatat non 
            proident, sunt in culpa qui officia 
            deserunt mollit anim id est laborum.",
        course_id: Course.find(Course.pluck(:id).sample).id,
        user_id: User.find(User.pluck(:id).sample).id,
        lecture_id: Lecture.find(Lecture.pluck(:id).sample).id
    )
end

puts "#{number_of_notes} notes created"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

8.times do |course|
    Course.create!(
        name: "Course number #{course}",
        code: "STUD#{course}",
        credits: 7.5,
        description: "This course can be taken at WOACT",
        main_image: "https://placeholdit.co//i/600x300?",
        thumbnail: "https://placeholdit.co//i/300x150?"
    )
end

puts "8 courses created"

10.times do |note|
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
        course_id: Course.find(Course.pluck(:id).sample).id
    )
end

puts "10 notes created"
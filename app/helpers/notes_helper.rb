module NotesHelper

    def gravatar_helper (user)
        image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}", width: 50, class: 'avatar'
    end

    def show_main_title
        if @notes_course.present?
            @notes_course.name
        else
            "My Notes"
        end
    end

    def filter_lectures(note)
        course_id = 0;
        
        if session[:current_course]
            course_id = session[:current_course]
        else
            course_id = note.course_id    
        end
        Lecture.where(course_id: course_id) 
    end
end

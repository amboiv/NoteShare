module NotesHelper

    def gravatar_helper (user)
        image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}", width: 50, class: 'avatar'
    end

    def show_main_title
        if params[:course_id]
            (params[:course_id]).titleize 
        else
            "My Notes"
        end
    end

    def filter_lectures(note)
        course_id = 0;
        
        if params[:course_id]
            course_id = Course.friendly.find(params[:course_id]).id
        else
            course_id = note.course_id    
        end
        Lecture.where(course_id: course_id) 
    end
end

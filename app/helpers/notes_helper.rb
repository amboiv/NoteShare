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

    class CodeRayify < Redcarpet::Render::HTML
        def block_code(code, language)
            CodeRay.scan(code, language).div
        end
    end

    def markdown(text)
        coderayified = CodeRayify.new(filter_html: true, hard_wrap: true)

        options = {
            fenced_code_blocks: true,
            no_intra_emphasis: true,
            autolink: true,
            lax_html_blocks: true,
        }

        markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
        markdown_to_html.render(text).html_safe
    end
end

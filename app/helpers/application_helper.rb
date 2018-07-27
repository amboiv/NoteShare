module ApplicationHelper
    def login_helper(classes_string = "")
        if current_user.is_a?(GuestUser)
            (link_to "Register", new_user_registration_path, class: classes_string + " " + is_active?(new_user_registration_path)) + " " +
            (link_to "Login", new_user_session_path, class: classes_string + " " + is_active?(new_user_session_path))
        else
            link_to "Log out", destroy_user_session_path, class: classes_string, method: :delete
        end
    end

    def source_helper(layout_name)
        if session[:source]
            greeting = "Thanks for visiting from #{session[:source]}, this page is using the #{layout_name} layout"
            content_tag(:p, greeting, class: "source_greeting")
        end
    end

    def is_active?(path)
        request.path == path ? "active" : ""
    end
    
    def copyright_generator
        AmbViewTool::Renderer.copyright 'amb', 'All rights rightfully reserved'
    end

    def navbar_links
        links =  [
            {
                path: courses_path,
                title: 'My Courses',
            },
            {
                path: notes_path,
                title: 'My Notes',
            },
        ]
        
        return links + special_links
    
    end

    def special_links
        if current_user.has_role?(:instructor)
            return [
                {
                    path: education_programs_path,
                    title: 'Education Programs',
                },
            ]
        elsif current_user.has_role?(:student)
            return [
                {
                    path: edit_user_registration_path,
                    title: 'Edit profile',
                },
            ]
        else
            return []
        end
    end

    def navbar_helper (classes, tag_type)
        navbar_content = ''
        navbar_links.each do |link|
            navbar_content << "<#{tag_type}><a href='#{link[:path]}' class='#{classes} #{is_active?(link[:path])}'>#{link[:title]}</a></#{tag_type}>"
        end
        navbar_content.html_safe  
    end

    def alerts
        alert = (flash[:alert]) || flash[:error] || flash[:notice]
        if alert
            alert_generator(alert)
        end
    end

    def alert_generator (message)
        js add_gritter(message, title: "Look here!", sticky: false)
    end

end

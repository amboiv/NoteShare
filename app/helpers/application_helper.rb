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
end

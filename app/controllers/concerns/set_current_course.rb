module SetCurrentCourse
    extend ActiveSupport::Concern

    included do
        before_action :set_current_course, only: [:index, :my_notes]
    end

    def set_current_course
        if params[:course]
            session[:current_course] = params[:course]
            @notes_course = Course.find(session[:current_course])
            @notes_course
        else
            session.delete(:current_course)
        end
    end
end
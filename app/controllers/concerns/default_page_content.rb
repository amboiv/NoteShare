module DefaultPageContent
    extend ActiveSupport::Concern

    included do
        before_action :set_page_defaults
    end


    
    def set_page_defaults
        @page_title = "NoteShare | Share Your Lecture Notes"
        @seo_keywords = "NoteShare Note Share Lecture Minute" #SearchEngineOptimization
    end
end

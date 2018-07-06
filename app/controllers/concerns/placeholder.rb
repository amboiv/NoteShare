module Placeholder
    extend ActiveSupport::Concern
    
    def self.generate_image(height:, width:)
        "https://placeholdit.co//i/#{width}x#{height}"
    end
end
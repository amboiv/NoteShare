module CoursesHelper
    def generate_image(height:, width:)
        "https://placeholdit.co//i/#{width}x#{height}"
    end

    def course_image(image, type)
        if image.attached?
            return image
        elsif type == 'thumbnail'
            generate_image(height: 200, width: 400)
        else
            generate_image(height: 300, width: 600)
        end
    end
end



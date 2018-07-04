class Course < ApplicationRecord
    valitates_presence_of :name, :code: :credits, :main_image, :thumbnail
end

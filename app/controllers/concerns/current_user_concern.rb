module CurrentUserConcern
    extend ActiveSupport::Concern

    def current_user
        super || guest_user
    end

    def guest_user
        guest = GuestUser.new
        guest.name = "Guest Lurker"
        guest.first_name = "Guest"
        guest.last_name = "Lurker"
        guest.email = "guest@guest.com"
        return guest
    end
end
class ApplicationController < ActionController::Base
    before_action :configure_permission_params, if: :devise_controller?

    def configure_permission_params
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
end

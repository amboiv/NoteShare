module DeviseWhitelist
    extend ActiveSupport::Concern

    included do
        before_action :configure_permission_params, if: :devise_controller?
    end

    def configure_permission_params
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :roles])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :roles])
    end
end
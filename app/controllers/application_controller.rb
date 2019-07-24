class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    protected
 
    def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:university_name, :name, :is_tutor])
    devise_parameter_sanitizer.permit(:account_update, keys: [:university_name, :name, :is_tutor])
    end
    private
   def after_sign_out_path_for(users)
       root_path
   end
end

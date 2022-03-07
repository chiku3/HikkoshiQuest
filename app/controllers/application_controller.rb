class ApplicationController < ActionController::Base
 before_action :authenticate_user!,except: [:top,:help]
 
 before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def after_sign_in_path_for(resource)
     my_page_path
  end

  def after_sign_out_path_for(resource_or_scope)
     root_path
  end
  
  def unchecked_notifications
    @notifications = current_user.passive_notifications.where(checked: false)
  end

end

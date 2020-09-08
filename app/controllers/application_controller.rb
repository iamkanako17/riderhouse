class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :hostname, :hostname_kana, :phone, :age, :gender])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:nickname, :hostname, :hostname_kana, :phone, :age, :gender])
  end
end

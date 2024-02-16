class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
  
  def configure_permitted_parameters
    
    if params[:user]
      year = params[:user][:"birthday(1i)"]
      month = params[:user][:"birthday(2i)"]
      day = params[:user][:"birthday(3i)"]
      birthday = "#{year}-#{month}-#{day}"
      # 結合した生年月日をストロングパラメーターに追加
      params[:user][:birthday] = birthday
    end

    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday])

  end
end

module SessionsHelper
	def log_in(user)
    cookies[:authentication_token] = user.authentication_token
  end

  def current_user
    @current_user ||= User.find_by_authentication_token(cookies[:authentication_token]) if cookies[:authentication_token]
    if @current_user.present?
      return @current_user
    else
      cookies[:authentication_token].delete if cookies[:authentication_token]
      return nil
    end   
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    cookies.delete(:authentication_token) if cookies[:authentication_token]
    @current_user = nil if @current_user
  end
end

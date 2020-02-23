class ApplicationController < ActionController::Base
	include SessionsHelper
	def check_usr
    if current_user.blank?
      flash[:alert] = "Your session has been expired,please try login again."
      return redirect_to '/'
    end  
  end
end

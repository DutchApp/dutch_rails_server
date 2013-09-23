class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  #before_filter :prepare_for_mobile

=begin
  def mobile_device?
  	puts "mobile_device?: mobile_param: #{session[:mobile_param]}"
  	puts "user agent: #{request.user_agent}"
  	if session[:mobile_param]
  		session[:mobile_param] == "1"
  	else
  		request.user_agent =~ /Mobile|webOS/
  	end
  end
  	helper_method :mobile_device?

  	def prepare_for_mobile
  		puts "prepare_for_mobile: mobile_param: #{session[:mobile_param]}"
  		session[:mobile_param] = params[:mobile] if params[:mobile]
  		request.format = :mobile if mobile_device?
  	end
=end

  def after_sign_in_path_for(resource)
    expenses_path
  end

end

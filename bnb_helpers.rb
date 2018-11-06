module BnBHelpers
  def current_user
    @current_user ||= User.find_by_email(session[:email])
  end
end

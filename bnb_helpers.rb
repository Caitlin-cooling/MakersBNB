module BnBHelpers
  def current_user
    @current_user ||= User.find(session[:email])
  end
end

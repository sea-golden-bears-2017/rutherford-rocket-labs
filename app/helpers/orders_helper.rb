module OrdersHelper
  def logged_in?
    redirect_to new_session_path if !session[:user_id]
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def confirm_logged_in
    unless session[:parent_id]
      flash[:notice] = "Please log in"
      redirect_to(login_login_path)
    end
  end


end

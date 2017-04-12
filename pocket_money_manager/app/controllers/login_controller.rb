class LoginController < ApplicationController
  def menu
    @username = session[:first_name]
  end

  def index
  end

 def login
 end

 def attempt_login
   if params[:email].present? && params[:password].present?
     found_parent = Parent.where(:email => params[:email]).first
     if found_parent
       authorised_parent = found_parent.authenticate(params[:password])
     end
   end
   if authorised_parent
     session[:parent_id] = authorised_parent.id
     p session[:parent_id]
     session[:email] = authorised_parent.email
     flash[:notice] = "You are now logged in"
     redirect_to(parent_path)
   else
     flash.now[:notice] = "Invalid username/password combination."
     render('login')
   end
 end

 def logout
   session[:parent_id] = nil
   session[:email] = nil
   session[:first_name] = nil
   flash[:notice] = "User logged out"
   redirect_to(login_login_path)
 end

 private

 def confirm_logged_in
   unless session[:parent_id]
     flash[:notice] = "Please log in"
     redirect_to(login_login_path)
   end
 end

end

class LoginController < ApplicationController
  def menu
    @username = session[:first_name]
  end

 def login
 end

 def attempt_login
   if params[:email].present? && params[:password].present?
     found_user = Parent.where(:email => params[:email]).first
     p found_user
     if found_user
       authorised_user = found_user.authenticate(params[:password])
     end
   end
   if authorised_user
     session[:parent_id] = authorised_user.id
     session[:email] = authorised_user.email
     flash[:notice] = "You are now logged in"
     redirect_to(parents_path)
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

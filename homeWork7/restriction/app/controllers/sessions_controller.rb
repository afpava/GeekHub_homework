class SessionsController < ApplicationController
skip_before_action :require_login

  # def index
  #   #redirect_to login_path
  # end
  def new
    redirect_to root_path
  end

  def create
          user = User.find_by(email: params[:email])
       if user && user.authenticate(params[:password])
         session[:user_id] = user.id
         redirect_to root_path

       else
         flash.now.alert = 'Email or password is invalid'
         render :new
       end
end

def destroy
  session[:user_id] = nil
  redirect_to root_url, notice: "Logged out!"
end

end

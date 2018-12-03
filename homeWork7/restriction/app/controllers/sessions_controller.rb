class SessionsController < ApplicationController
skip_before_action :require_login

  def index
    #redirect_to login_path
  end
  def new
    redirect_to root_path
  end

  def create
      #  session[:return_to] = nil
        user = User.find_by(email: params[:email])
       if user && user.authenticate(params[:password])
         session[:user_id] = user.id
         #redirect_to params[:referer], notice: 'Logged in!'
         redirect_to root_path
         # if ( request.referrer != signup_url ) && ( request.referrer != sessions_url )
         #      redirect_back(fallback_location: root_url)
         # else
         #      redirect_to root_path
         #  end
       else
         flash.now.alert = 'Email or password is invalid'
         render :new
       end
end

def destroy
  session[:user_id] = nil
  redirect_to root_url, notice: "Logged out!"
end

private
  def session_params
      params.require(:session).permit(:email, :password)
  end

end

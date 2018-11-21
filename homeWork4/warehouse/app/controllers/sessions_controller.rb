class SessionsController < ApplicationController
      def index
        redirect_to login_path
      end
      def new
        session[:return_to] = request.referrer if (request.referrer && request.referrer != login_url && request.referrer != sessions_url)
      end

      def create
          #  session[:return_to] = nil
            user = User.find_by(email: params[:email])
           if user && user.authenticate(params[:password])
             session[:user_id] = user.id
             #redirect_to params[:referer], notice: 'Logged in!'
             if ( request.referrer != signup_url ) && ( request.referrer != sessions_url )
                  redirect_back(fallback_location: root_url)
             else
                  redirect_to session[:return_to]
              end
           else
             flash.now.alert = 'Email or password is invalid'
             render :new
           end
    end

    def destroy
      session[:user_id] = nil
      redirect_back fallback_location: request.referrer, notice: "Logged out!"
    end

    private
      def session_params
          params.require(:session).permit(:email, :password)
      end
end

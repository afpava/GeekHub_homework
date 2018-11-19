class SessionsController < ApplicationController
      def new
        session[:return_to] = request.referrer if request.referrer
      end

      def create
            user = User.find_by(email: params[:email])
           if user && user.authenticate(params[:password])
             session[:user_id] = user.id
             #redirect_to params[:referer], notice: 'Logged in!'
             redirect_back(fallback_location: root_url)
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

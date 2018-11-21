class UsersController < ApplicationController
  #wrap_parameters :user, include: [:name, :password, :password_confirmation]
  before_action :user_params, only: [:edit]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

      def new
        session[:return_to] = request.referrer if (request.referrer && request.referrer != signup_url && request.referrer != sessions_url)
        @user = User.new

      end

      def index
        @users = User.all
        if request.referrer == signup_url
          redirect_to signup_path
        end
      end

      def edit

      end

      def destroy
        @user.destroy
        respond_to do |format|
          format.html { redirect_to stores_url, notice: 'user was successfully destroyed.' }
        #  format.json { head :no_content }
        end
      end

      def create
          #session[:return_to] = nil
          @user = User.new(user_params)
            if @user.save
          session[:user_id] = @user.id
          #redirect_to root_url, notice: "Thank you for signing up!"
          redirect_to params[:referer] , notice: "Thank you for signing up!"
        else
          render "new"
        end
      end

    private

      def set_user
        @user = User.find(params[:id])
      end

      def user_params
          params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end

end

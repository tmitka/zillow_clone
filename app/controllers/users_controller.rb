class UsersController < ApplicationController
    def new
    end

    def create
        @user = User.new user_params
        if @user.save
        session[:current_user_id]= @user.id
        redirect_to "/"
        else
        flash[:errors]= @user.errors.full_messages
        redirect_to '/users'
        end
    end

    def login
        @user = User.find_by_email(params[:email]).try(:authenticate,params[:password])
        if @user
        session[:current_user_id] = @user.id
        session[:current_user_name] = @user.first_name
        session[:current_user_email]
        redirect_to '/'
        else
        flash[:errors] = ["Invalid email or password"]
        redirect_to '/users'
        end
    end

    def edit
    end

    def update
        @user = current_user
        if @user.valid?
            @user.update(user_params)
            @user.save
            redirect_to "/users/#{@user.id}"
        else flash[:errors]= @user.errors.full_messages
            redirect_to "/users/#{@user.id}"
        end
    end

    def logout
        reset_session
        redirect_to root_path
    end


    def show
        @agents = User.where(agent: true)
    end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :phone_number, :agent,)
    end
end

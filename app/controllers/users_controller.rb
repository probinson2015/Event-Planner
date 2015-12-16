class UsersController < ApplicationController
  def create
  	user = User.new(user_params)
  	if user.valid?
  		user.save
	  	session[:user_id] = user.id
	  	flash[:success]  = "Account created successfully. Please login!"
	  	redirect_to "/"
	  else
	  	flash[:errors] = user.errors.full_messages
	  	redirect_to "/"
  	end

  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
	@user = User.find(params[:id])
      if !@user.update(user_params)   
        # render json: @user
        flash[:errors] = @user.errors.full_messages
        redirect_to "/users/#{@user.id}/edit"
      else
        flash[:success] = "Account updated successfully"
        redirect_to "/users/#{@user.id}"
     end 
   end

  private 
  def user_params
   params.require(:user).permit(:first_name, :last_name, :email, :location, :state, :password, :password_confirmation)
  end
end

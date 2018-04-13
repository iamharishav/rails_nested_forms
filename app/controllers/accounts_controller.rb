class AccountsController < ApplicationController
	
	before_action :set_user, only: [:show, :edit, :update, :destroy]

	def index
		@users = User.all
	end

	def new
		@user = User.new
  	@user.build_account
	end

	def create
		@user = User.new(user_params)
		respond_to do |format|
			if @user.account.save
				format.html { redirect_to accounts_path }
			else
				format.html { render :new }
			end
		end
	end

	def edit
	end

	def update
		respond_to do |format|
			if @user.update_attributes(user_params)
				format.html { redirect_to accounts_path }
			else
				format.html { render :new }
			end
		end
	end

	def show
	end

	def destroy
		if @user.destroy
			flash[:notice] = "User has been deleted"
		else
			flash[:notice] = "User could not be deleted. Please try again"
		end
		redirect_to accounts_path
	end
	

	private

		def set_user
			@user = User.find(params[:id]) if params[:id]
		end

		def user_params
			params.require(:user).permit(:email, :password, account_attributes: [:first_name, :last_name])
		end
end
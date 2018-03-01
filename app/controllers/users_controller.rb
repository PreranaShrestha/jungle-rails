class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json

  # GET /users/1
  # GET /users/1.json


  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit


  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to '/'
      else
        redirect_to '/signup'
      end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json


  # DELETE /users/1
  # DELETE /users/1.json


  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name)
    end
end

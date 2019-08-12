class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :authenticate_request, except: [:login, :confirm]

  # GET /api/v1/users
  def index
    @users = User.all

    render json: @users
  end

  # GET /api/v1/users/1
  def show
    render json: @user
  end
 
  # POST /api/v1/users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: { status: 'User created successfully', user: @user }, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/users/1
  def destroy
    @user.destroy
  end

  def login 

    user = User.find_by(email: params[:email].to_s.downcase) 

    if user && user.authenticate(params[:password])

      if user.confirmed_at?

        token = JsonWebToken.encode(user_id: user.id)
        render json: { access_token: token, date_created: Time.now, expiry_date: Time.new + 1200 ,user_id: user.email  }, status: :ok

      else

        render json: { error: 'Email not verified' }, status: :unauthorized

      end

    else

        render json: {error: 'Invalid username/password'}, status: :unauthorized

    end
  end


  # CONFIRM /api/v1/users/confirm/[token]
  def confirm

    token = params[:token].to_s
    user = User.find_by(confirmation_token: token)

    if user.present? && user.confirmation_token_valid?
      user.mark_as_confirmed!
      render json: {status: 'User confirmed successfully'}, status: :ok
    else
      render json: {status: 'Invalid token'}, status: :not_found
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end

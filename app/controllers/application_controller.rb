#
#
#

require 'json_web_token'

class ApplicationController < ActionController::API
  

  protected

  # Validates the token and user and sets the @current_user scope
  def authenticate_request

    if !payload || !JsonWebToken.valid_payload(payload.first)
      return invalid_authentication
    end

    load_current_user!
    invalid_authentication unless @current_user
  rescue JWT::DecodeError => e
    render json: { errors: e.message, message: 'Invalid or empty token' }, status: :unauthorized
  rescue StandardError => e
    render json: { errors: e.message, message: 'An error has occured' }, status: :unauthorized
  end

  # Returns 401 response. To handle malformed / invalid requests.
  def invalid_authentication
   render json: {error: 'Invalid Request'}, status: :unauthorized
  end

  private

  # Deconstructs the Authorization header and decodes the JWT token.
  def payload
    auth_header = request.headers['Authorization']
    token = auth_header.split(' ').last if auth_header
    JsonWebToken.decode(token)
  end

  # Sets the @current_user with the user_id from payload
  def load_current_user!
    @current_user = User.find_by(id: payload[0]['user_id'])
  rescue ActiveRecord::RecordNotFound => e
    render json: { errors: e.message }, status: :unauthorized
  end

end

# frozen_string_literal: true

# This shiny device polishes bared foos
class ApplicationController < ActionController::Base
  include JwtWebToken

  before_action :expiration

  private

  def expiration
    # return redirect_to logins_new_url if params[:token].nil?

    begin
      @token = params[:token]
      user_id = JwtWebToken.jwt_decode(params[:token])['id']
      @current_user = Registration.find_by_id(user_id)
    rescue JWT::ExpiredSignature
      render json: { error: 'Token has expired' }
    end
  end
end

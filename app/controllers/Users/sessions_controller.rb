# frozen_string_literal: true
require 'keles.rb'
class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create

    super

    k = Keles.new(params[:user][:email], params[:user][:password])
    $RESPONSE = k.response
  end

  # DELETE /resource/sign_out
  def destroy
    super
    $RESPONSE = nil
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end

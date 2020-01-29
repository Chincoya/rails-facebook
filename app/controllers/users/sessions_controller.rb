# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  skip_before_action :require_no_authentication, only: [:new]

  # GET /resource/sign_in
  # def new
  #   if @user = current_user
  #     redirect_to @user
  #   else
  #     super
  #   end
  # end

  # POST /resource/sign_in
  # def create
  #   redirect_to users_path
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end

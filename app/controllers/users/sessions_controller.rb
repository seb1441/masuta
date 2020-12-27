# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    # respond_with resource, location: after_sign_in_path_for(resource)

    respond_to do |format|
      format.turbo_stream do
        if warden.authenticate(auth_options)
          self.resource = warden.authenticate(auth_options)
          sign_in(resource_name, resource)
          flash[:notice] = "Successfully signed in!"
          yield resource if block_given?

          # redirect_to :root
          respond_with resource, location: after_sign_in_path_for(resource)
        end
      end
      format.html { redirect_to '/' }
    end
  end

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

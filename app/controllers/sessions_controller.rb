class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token
    swagger_controller :session, "Authentication"
    def new
    end

    swagger_api :create do
        summary "Gather a token"
        param :form, "session[email]", :string, :required, "User email"
        param :form, "session[password]", :string, :required, "User password"
    end
    def create
      respond_to do |format|
        user = User.find_by(email: params[:session][:email])

        if user && user.authenticate(params[:session][:password])
            format.html do
            log_in user
            redirect_to '/categories'
            end
            format.json do
                user.password = params[:session][:password]
                user.regenerate_token
                render json: { token: user.token }
            end

        else
            format.html do
                render 'new'
            end 
            format.json do
                render json: { message: 'Login lub hasło nieprawidłowe' }
             end
         end
     end
 end

 swagger_api :destroy do
    summary "Invalidate a token"
    param :header, "Authorization", :string, :required, "Authentication token"
 end
    def destroy
        respond_to do |format|
            format.html do
                log_out
                redirect_to "/"
            end
            format.json do
                require_token
                if current_user
                    current_user.invalidate_token
                end
            end
        end
    end
end

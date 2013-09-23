class Users::SessionsController < Devise::SessionsController
  prepend_before_filter :require_no_authentication, :only => [ :new, :create ]
  prepend_before_filter :allow_params_authentication!, :only => :create
  prepend_before_filter { request.env["devise.skip_timeout"] = true }

  # GET /sign_in
  def new
    self.resource = build_resource(nil, :unsafe => true)
    clean_up_passwords(resource)
    #respond_with(resource, location: new_user_session_path)
    redirect_to root_path
  end


  # POST /users/sign_in
  def create
    respond_to do |format|
      format.html {super}
      format.json do
        logger.debug 'Sign in request received from mobile'
        build_resource
        user = User.find_for_database_authentication(:email => params[:email])
        return invalid_login_attempt unless user
        if user.valid_password?(params[:password])
          user.ensure_authentication_token!
          render :json => { :auth_token => user.authentication_token, :user_id => user.id }, :status => :created
          return
        end
      end
    end
  end

  # DELETE /users/sign_out
  def destroy
    respond_to do |format|
      format.html {super}
      format.json do
        auth_token = request.headers['X-API-TOKEN']
        #logger.debug "Auth Token: [#{mask auth_token}]"
        if auth_token.nil?
          render json:{message: 'No Auth Token found.'}, status: :precondition_failed
          return
        else
          user = User.find_by_authentication_token(request.headers['X-API-TOKEN'])
          if user.nil?
            render json:{message: 'No user found for requested auth token'}, status: :precondition_failed
          else
            signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
            user.reset_authentication_token!
            render json:{message: 'Sign out successful.'}, status: :accepted
          end
        end

      end
    end
  end

  private
  def invalid_login_attempt
    warden.custom_failure!
    render :json => { :errors => ["Invalid email or password."] },  :success => false, :status => :unauthorized
  end
end

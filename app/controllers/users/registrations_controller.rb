class Users::RegistrationsController < Devise::RegistrationsController

  # POST /resource
  def create
    respond_to do |format|
      format.html do
        build_resource
        if resource.save
          if resource.active_for_authentication?
            set_flash_message :notice, :signed_up if is_navigational_format?
            sign_up(resource_name, resource)
            respond_with resource, :location => after_sign_up_path_for(resource)
          else
            set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
            expire_session_data_after_sign_in!
            respond_with resource, :location => after_inactive_sign_up_path_for(resource)
          end
        else
          clean_up_passwords resource
          respond_with resource, :location => after_inactive_sign_up_path_for(resource)
        end
      end
      format.json do
        build_resource
        if resource.save
          sign_up(resource_name, resource)
          render json: resource, status: :created
        else
          logger.debug resource.errors
          render json: resource.errors, status: :unprocessable_entity
        end
      end
    end

  end
end

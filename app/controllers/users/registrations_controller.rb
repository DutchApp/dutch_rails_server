class Users::RegistrationsController < Devise::RegistrationsController

  def create
    respond_to do |format|
      format.html {super}
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

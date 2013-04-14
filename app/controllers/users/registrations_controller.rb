class Users::RegistrationsController < Devise::RegistrationsController

  def create
    respond_to do |format|
      format.html {super}
      format.json do
        build_resource
        if resource.save
          render json: resource, status: :created
        else
          render json: resource.errors, status: :unprocessable_entity
        end
      end
    end

  end
end

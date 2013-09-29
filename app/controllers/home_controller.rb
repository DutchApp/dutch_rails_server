class HomeController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:index]

  def index
    if user_signed_in?
      redirect_to expenses_path
    end
  end
end

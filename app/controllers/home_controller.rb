class HomeController < ApplicationController
  def index
    if user_signed_in?
      if current_user.receptionist?
        redirect_to dashboards_receptionist_path
      elsif current_user.doctor?
        redirect_to dashboards_doctor_path
      else
        # Handle other roles or show a default page
      end
    end
    # If not signed in, it will render the index view by default
  end
end

class DashboardsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_receptionist!, only: [:receptionist]
  before_action :authorize_doctor!, only: [:doctor]

  def receptionist
    @patients = Patient.all
  end

  def doctor
    @patients = Patient.all
    @registration_data = Patient.group_by_day(:created_at, last: 30).count
  end

  private

  def authorize_receptionist!
    redirect_to root_path, alert: 'Access denied.' unless current_user.receptionist?
  end

  def authorize_doctor!
    redirect_to root_path, alert: 'Access denied.' unless current_user.doctor?
  end
end

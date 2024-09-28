class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { receptionist: 'receptionist', doctor: 'doctor' }

  def receptionist?
    role == 'receptionist'
  end

  def doctor?
    role == 'doctor'
  end
end

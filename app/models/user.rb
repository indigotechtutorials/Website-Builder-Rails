class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :websites
  has_many :user_roles

  def admin?
    user_roles.where(role: Role.admin_role).any?
  end
end

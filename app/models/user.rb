class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  DeviseController.class_eval do
    def resource_params
      unless params[resource_name].blank?
        params.require(resource_name).permit(:email, :password, :password_confirmation, :remember_me)
      end
    end
  end
end

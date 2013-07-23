class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  DeviseController.class_eval do
    def resource_params
      unless params[resource_name].blank?
        params.require(resource_name).permit(:email, :password, :password_confirmation,
                                             :remember_me, :first_name, :last_name, :username)
      end
    end
  end

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true,
                       uniqueness: true,
                       format: {
                         with: /\A[a-zA-Z0-9_-]+\z/,
                         message: 'Must be formatted correctly.'
                       }

  def full_name
    first_name + " " + last_name
  end

  def gravatar_url
    stripped_email = email.strip
    downcased_email = stripped_email.downcase
    hash = Digest::MD5.hexdigest(downcased_email)

    "http://gravatar.com/avatar/#{hash}"
  end
end

class Contact < ActiveRecord::Base
  belongs_to :user
 
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true,
                       format: {
                         with: /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i,
                         message: "The email must be formatted correctly."
                       }
   validates :phone,
   				format: {
   					with: /\A[0-9()-]+\z/,
   					message: "Phone numbers can't have letters"
   				}
   validates :mobile,
   				format: {
   					with: /\A[0-9()-]+\z/,
   					message: "Mobile phone numbers can't have letters"
   				}
end
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name,  presence: true
  validates :last_name, presence: true
  validates :aadhar, presence: true
  validates :mobile, presence: true
  validates :email, confirmation: { case_sensitive: false }, format: { with: /\@inmar.com\z/,
    message: "Email must be from @inmar.com" }
  has_many :groups
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name,  presence: true
  validates :last_name, presence: true
  validates :aadhar, presence: true
  validates :mobile, presence: true
  validates :email, confirmation: { case_sensitive: false }
  has_many :contacts
  has_many :groups
end

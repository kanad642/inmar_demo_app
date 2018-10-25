class GroupContact < ApplicationRecord
 belongs_to :group
 validates :name,  presence: true
 # validates :email, confirmation: { case_sensitive: false }, format: { with: /\@inmar.com\z/, message: "Email must be from @inmar.com" }
end

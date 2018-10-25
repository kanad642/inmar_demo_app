class Group < ApplicationRecord
  has_many :group_contacts
  validates :name, uniqueness: {  message: "Already taken chose different one!" }
end

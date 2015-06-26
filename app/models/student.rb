class Student < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  has_many :projects
end

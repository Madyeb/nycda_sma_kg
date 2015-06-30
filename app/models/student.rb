class Student < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  has_many :projects

  has_many :student_courses
  has_many :courses, through: :student_courses
end

class Student < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  has_many :projects

  has_many :student_courses
  has_many :courses, through: :student_courses

  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => ":style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end

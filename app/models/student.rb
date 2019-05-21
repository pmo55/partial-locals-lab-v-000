# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  #def self.search(search)
   # if search.present?
    #  where('name LIKE ?',"%#{search}%")
    #else
     #self.all
   #end
  #end
def search(search)
  if params[:search]
    @student = Student.where('name LIKE ?', "#{params[:search]}")
  else
    @student = Student.all
end
end
end

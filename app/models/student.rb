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
  
  def search(search)
    if params[:search]
      @students  = Student.where('search LIKE ?',"%#{params[:search]}%")
    else
      @students = Student.all
   end
  end
end

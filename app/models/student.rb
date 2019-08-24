# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :keyword
#  hometown   :keyword
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(keyword)
    if !keyword == nil || !keyword.empty?
      self.all.select { |s| s if s.name.downcase.include?(keyword.downcase) }
    else 
      Student.all 
    end 
  end
end

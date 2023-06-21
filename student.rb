require './person'

class Student < Person
  attr_accessor :classroom

  def initialize(id, age, name = 'Unknown', parent_permission: true, classroom: nil)
    super(id, age, name, parent_permission)
    @classroom = classroom
    add_student_to_classroom if classroom
  end

  def add_student_to_classroom
    classroom.add_student(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end

require_relative 'person'

# student inherits from person
class Student < Person
  attr_reader :classroom
  attr_accessor :type

  # constructor
  def initialize(age, classroom, name = 'Unknown', type = 'Student', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
    @type = type
  end

  # Mehod to play
  def play_hooky
    '¯(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end

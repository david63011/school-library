class People
  def initialize(app)
    @app = app
  end

  def regstudent
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase == 'y'
    print 'Classroom: '
    classroom = gets.chomp
    @app.create_student(classroom, age, name, parent_permission)
  end

  def regteacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    @app.create_teacher(age, name, specialization)
  end

  def people
    print 'Do you want to create a student (1) or a Teacher (2)? [Input the number]:'
    selection = gets.chomp
    num = selection.to_i
    case num
    when 1
      regstudent
    when 2
      regteacher
    else
      puts 'Wrong Input.'
    end
  end
end


def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit enter twice"

  students = []

  name = gets.chomp

  while !name.empty?

    students << {name: name, cohort: :november}

    puts "Now we have #{students.count} students"

    name = gets.chomp #this is refering to the line before, chomping the puts line from "now we have x students"
    #because name is the same variable as on our while loop, we can reset our original name that way.
    
  end
  students
end


def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each {|student|
puts "#{student[:name]} #{student[:cohort]} cohort"
  }
end

def print_footer(students)
  puts "Overall we have #{students.count} great students"
end


students = input_students #which returns an array to the students variable
print_header
print(students)
print_footer(students)

@students = [] #so that if you go for option 2 first, it will at least print
#an empty array. We don't have to worry about the array resetting itself each
#time because it's outside the loop

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end


def interactive_menu
  loop do
    print_menu
    process(gets.chomp) #so interesting that you can split the puts and gets like this
  end
end


def process (selection)
  case selection
    when "1"
      @students = input_students #interesting use of the array here
      #I reckon this means you can only chose to input the students once
      #as the array will reset itself.
    when "2"
      show_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"

  end
end


def show_students
  print_header
  print_students_list
  print_footer
end


def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit enter twice"

  #@students = []

  name = gets.chomp

  while !name.empty?

    @students << {name: name, cohort: :november}

    puts "Now we have #{@students.count} students"

    name = gets.chomp #this is refering to the line before, chomping the puts line from "now we have x students"
    #because name is the same variable as on our while loop, we can reset our original name that way.

  end

end


def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each {|student|
puts "#{student[:name]} #{student[:cohort]} cohort"
  }
end

def print_footer
  puts "Overall we have #{@students.count} great students"
end

interactive_menu

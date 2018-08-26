@students = [] #so that if you go for option 2 first, it will at least print
#an empty array. We don't have to worry about the array resetting itself each
#time because it's outside the loop

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from studetns.csv"
  puts "9. Exit"
end


def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp) #so interesting that you can split the puts and gets like this
  end
end


def process (selection)
  case selection
    when "1"
      input_students #interesting use of the array here
      #I reckon this means you can only chose to input the students once
      #as the array will reset itself.
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
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

  name = STDIN.gets.chomp

  while !name.empty?

    @students << {name: name, cohort: :november}

    puts "Now we have #{@students.count} students"

    name = STDIN.gets.chomp #this is refering to the line before, chomping the puts line from "now we have x students"
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


def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student [:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv") #this is more flexible (an argument) but we still have a default value.
  file = File.open(filename, "r")
  file.readlines.each do |line| #very interesting
    name, cohort = line.chomp.split(",") #creates an array with two values.
    #Also very interesting, naming two variables at once: this is caleld parallel assignment
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end


def try_load_students
  filename = ARGV.first
  return if filename.nil? #confusing, why is this necessary if we've got our else method below...
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist"
    exit
  end
end

try_load_students
interactive_menu

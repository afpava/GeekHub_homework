#This is my Very first homework in Ruby
#by Afanasiev Pasha
def file_parser(file)
  if File.file?(file)
    names_file = File.readlines(file)
    @first_name = Array.new
    @last_name = Array.new
    @names = names_file.each do |full_name|
      full_name.strip!
      name = full_name.split
      @last_name << name.pop
      @first_name << name.join(' ')
      name.class
    end
  else
    puts "File #{file} doesn't exist"
  end
end

file_parser("names.txt")
#Array with names
print "Array with names: \n #{@names}"
#Getting rid of titles Mr., Mrs., Dr., Jr.
names = @names.each {|name|  name.gsub!(/Mr[.]|Mrs[.]|Dr[.]|Jr[.]/, "").strip! }
print "\n\n Names without titles:\n #{names} \n"
#Creating a Hash: key - is first_name; value - is last_name
first_name = @first_name.map { |item| item.split(' ').last}
last_name = @last_name.map { |item| item.split(' ').first}
a =[first_name, last_name].transpose.to_h
print "\n Hash with a key as a first_name and value as last_name :\n #{a}"

#Creating a Hash: key - is the 1 letter of first_name, value is 2 letter from last_name
let_first_name = first_name.map { |item| item[0] }
let_last_name = last_name.map { |item| item[1] }

b = [let_first_name, let_last_name].transpose.to_h

print "\n\n  Hash with a key as first letter of the first_name and value as the second letter of the last_name :\n #{b} \n \n"

names_short = [first_name.map { |item| item[0] }, last_name.map { |item| item[0] }].transpose.to_a.flatten

#Swiching places
switched = names.map {|item| item.split(' ').reverse.join(' ') }

print "We've switched first_name and last_name: \n #{switched}"

##Integers

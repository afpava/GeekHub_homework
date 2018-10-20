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
hash_full =[first_name, last_name].transpose.to_h
print "\n Hash with a key as a first_name and value as last_name :\n #{hash_full}"

#Creating a Hash: key - is the 1 letter of first_name, value is 2 letter from last_name
let_first_name = first_name.map { |item| item[0] }
let_last_name = last_name.map { |item| item[1] }

hash_min = [let_first_name, let_last_name].transpose.to_h

puts "\n\n  Hash with a key as first letter of the first_name and value as the second letter of the last_name :\n #{hash_min} \n \n"

names_short = [first_name.map { |item| item[0] }, last_name.map { |item| item[0] }].transpose.to_a.flatten

#Swiching places
switched = names.map {|item| item.split(' ').reverse.join(' ') }

puts "We've switched first_name and last_name: \n #{switched}"

##Integers
numbers = Array.new(15){|i| i=rand(1000000000...9999999999) }
puts "\n Creating Array with 15-n 10 digits numbers: \n #{numbers}"
#Hash with key:number and value:biggest number

num_hash=Hash.new
numbers.each {|num| num_hash[num]=num.to_s.split("").max}
puts "\n Hash with key:number and value:biggest number \n #{num_hash}"

num_str=Array.new
numbers.each do |num|
num_str << num.to_s.split("").max
num_str << num.to_s.split("").min
  end
puts "\n Number consists of biggest number and smallest number from array numbers #{num_str.join}"

#Summ is two maximum and two minimum elements
number = []
numbers.each {|num| number << num.to_s.split("")}
number.flatten!

num_max = number.sort.last(2)
num_min = number.sort.first(2)

number = num_max[0].to_i + num_max[1].to_i + num_min[0].to_i+num_min[1].to_i
puts"\n Summ is two maximum and two minimum elements \n#{num_max[0]} + #{num_max[1]} +#{num_min[0]} + #{num_min[1]} = #{number}"

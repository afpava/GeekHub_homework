numbers = [
  [1,2,3],
  [2,2,2],
  [3,2,1]
]
lines = Array.new
lines = numbers.map do |num|
num.map!{|i|
 '*'*i
}
end
#lines.map!{ |line| line.pack("A4A4A3")
#  p line
#}
lines.map!{ |line| line.join(" ")
  #p line
}
lines.each {|line| puts line}

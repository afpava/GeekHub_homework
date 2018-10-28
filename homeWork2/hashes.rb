languages = {
  de: 'German',
  en: 'English',
  es: 'Spanish'
}

dictionary = {
  de: {one: 'eins', two: 'zwei', three: 'drei'},
  en: {one: 'one', two: 'two', three: 'three'},
  es: {one: 'uno', two: 'dos', three: 'tres'}
}

# Text lines based on the hashes
#printing line in German
languages.each_key { |lan|
  if lan.to_s != "en"
      text_line = "In #{languages[lan]}, "
      dictionary[lan].each_key { |num|
        text_line << "#{dictionary[lan][num]} means #{dictionary[:en][num]}, "
      }
    puts text_line.chomp(", ") << "."
  end
}

#Creating Table
#class method to_table is not my, author Darth Egregious https://stackoverflow.com/questions/36156305/console-table-format-in-ruby
class Array
  def to_table
    column_sizes = self.reduce([]) do |lengths, row|
      row.each_with_index.map{|iterand, index| [lengths[index] || 0, iterand.to_s.length].max}
    end
    #puts head = '-' * (column_sizes.inject(&:+) + (3 * column_sizes.count) + 1)
    self.each do |row|
      row = row.fill(nil, row.size..(column_sizes.size - 1))
      row = row.each_with_index.map{|v, i| v = v.to_s + ' ' * (column_sizes[i] - v.to_s.length)}
      puts '| ' + row.join(' | ') + ' |'
    end
#    puts head
  end
end

puts "\n Table: \n"

dict_array = Array.new

dictionary.each {|lan, num|
  line_text ="|"
  dict_array << num.values.unshift(lan.to_s)
   }

  #num.each_value {|i| dict_array << "#{i.to_s}"}
  #p line_text
  dict_array.to_table
#  dictionary[lan].each_value{|value| p "#{value} means #{dictionary[:en][num]}"
  #}

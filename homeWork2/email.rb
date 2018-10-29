require 'csv'

class Email
  def initialize(subject, headers)
    @subject = subject
    @headers = headers
    @@header = @headers
  end

  def result
      @headers.each {
      |head, val|
      puts "#{head.to_s.capitalize}: #{val}"

    }
    puts "Subject: #{@subject}"
    puts "\n"

  end

  def result_html

    puts "                 <tr>"
    @headers.each { |head, val|
    puts "                    <td> #{val} </td>"    }
    puts "                    <td> #{@subject} </td>"
    puts "                 </tr>"
  end

  def add
    CSV.open('./emails.csv', "a") do |csv|
      csv << [@headers[:date],@headers[:from], @subject]
      end
    puts "New record was added to emails.csv file!"
  end
end

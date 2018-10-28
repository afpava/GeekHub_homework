class Email
  def initialize(subject, headers)
    @@subject = subject
    @@headers = headers
  end

  def result
    @@headers.each {
      |head, val|
      puts "#{head.to_s.capitalize}: #{val}"
    }
    puts "Subject: #{@@subject}"
    public
  end

end

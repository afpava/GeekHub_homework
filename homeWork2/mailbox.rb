require "./email"

class Mailbox < Email
  def initialize(name, emails)
    @@name = name
    @@emails = emails
  end

  def result
     @@emails.each {|mail|puts mail.result}
  end
end

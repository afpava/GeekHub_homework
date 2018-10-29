require "./email"

class Mailbox < Email
  def initialize(name, emails)
    @@name = name
    @@emails = emails
  end

  def result
    puts  @@emails.each {|mail| mail.result}
  end
#
  def result_html
    puts  "                <tbody>"
      @@emails.each {|mail| mail.result_html}
    puts  "                </tbody>"
  end
end

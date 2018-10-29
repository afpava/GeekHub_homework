require "./mailbox_html"
require 'csv'

class EmailsCsvStore < Email
  def initialize(filename)
    @filename = filename
  end

  def read
    emails1 = Array.new
    csv_hash = CSV.read(@filename, headers: true, header_converters: :symbol).map(&:to_h)
    csv_hash.each{|key|
      emails1 << Email.new(key[:subject], key.slice(:date, :from))
    }
    return emails1
  end
end

store = EmailsCsvStore.new('emails.csv')
emails = store.read
mailbox = Mailbox.new('Ruby Study Group', emails)
formatter = MailboxHtmlFormatter.new(mailbox)

#Generating emails.html file
f=File.new('./emails.html', 'w+')
old_stdout = $stdout
$stdout = f
formatter.format
f.close
$stdout = old_stdout

print "Done! Open emails.html file via browser"

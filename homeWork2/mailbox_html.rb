require "./mailbox"

class MailboxHtmlFormatter < Mailbox

      def initialize(mails)
          @mails =mails
      end

      def format

      table_head = []
        @@headers.each {
          |head, val|
        table_head  << head.to_s.capitalize
        }

        table_head.map! { |head|
          "<tr> #{head} </tr>"
        }
        p table_head
      html = <<-HEREDOC
      <html>
          <head>
            <style>
              table {
                border-collapse: collapse;
              }
              td, th {
                border: 1px solid black;
                padding: 1em;
              }
            </style>
          </head>
            <body>
              <h1>#{@@name}</h1>
              <table>
                <thead>
                  <tr>
                  
                    <%  table_head.each{|head| puts head } %>



                    <th>Date</th>
                    <th>From</th>
                    <th>Subject</th>
                  </tr>
                </thead>
                <tbody>
                <tr>
                  <td>#{}</td>
                  <td>#{}</td>
                  <td>#{}</td>
                </tr>
                </tbody>
              </table>
            </body>
      </html>

      HEREDOC
      puts html
      #puts @mails
    end
end

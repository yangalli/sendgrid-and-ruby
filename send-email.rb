require 'sendgrid-ruby'

include SendGrid

from = SendGrid::Email.new(email: 'yangalli13@gmail.com')
subject = 'Sending email with Twilio Sendgrid...'
to = SendGrid::Email.new(email: 'yan@ribon.io')
content = SendGrid::Content.new(type: 'text/plain', value: 'and easy to do anywhere, even in Ruby!')
mail = SendGrid::Mail.new(from, subject, to, content)

sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
response = sg.client.mail._('send').post(request_body: mail.to_json)

puts response.status_code
puts response.body
puts response.headers
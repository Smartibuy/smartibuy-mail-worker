require 'mailgun'
require 'config_env'
require 'httparty'
require 'slim'
API_SERVER = "http://smartibuyapidynamo.herokuapp.com/api"
API_VER = "v1"

user_list = HTTParty.get("#{API_SERVER}/#{API_VER}/get_user_date/").to_h

puts user_list

template_path = "contents.slim"
template = ""
user_list["data"].each do |user|
  parameters = {
    :name => user["id"],
    :hashtag => user["hashtag"],
  }
  puts parameters
  template = Slim::Template.new(template_path).render(Object.new, parameters)
end





File.open("filename.html", "w") do |aFile|
  aFile.puts template
end




# mg_client = Mailgun::Client.new ENV["MAILGUN_API_KEY"]
#
# # Define your message parameters
# message_params = {:from    => 'no-reply@sandbox3407e2df76274ee69f7ec89a064e1d8b.mailgun.org',
#                   :to      => 'qoo392@gmail.com',
#                   :subject => 'The Ruby SDK is awesome!',
#                   :text    => 'It is really easy to send a message!'}
#
# # Send your message through the client
# mg_client.send_message "sandbox3407e2df76274ee69f7ec89a064e1d8b.mailgun.org", message_params

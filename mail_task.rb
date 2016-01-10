require_relative 'bundle/bundler/setup'
require 'json'
require 'aws-sdk'
require 'httparty'
require 'slim'
require 'mailgun'

API_SERVER = "http://smartibuyapidynamo.herokuapp.com/api"
API_VER = "v1"

config = JSON.parse(File.read('config/config.json'))
ENV.update config



user_list = HTTParty.get("#{API_SERVER}/#{API_VER}/users/")



puts user_list

template_path = "contents.slim"
template = ""
user_list["data"].each do |user|
  if not user["hashtag"].nil?
    data = Array.new
    user["hashtag"].each do |tag|
      res = HTTParty.get(URI.escape("#{API_SERVER}/#{API_VER}/mobile01/#{tag}"))
      if res.code == 200
        data << {
          "tag"=> tag,
          "contents" => res
        }
      end
    end

    parameters = {
      :name => user["id"],
      :data => data
    }
    puts parameters
    template = Slim::Template.new(template_path).render(Object.new, parameters)
    mg_client = Mailgun::Client.new ENV["MAILGUN_API_KEY"]

    # Define your message parameters
    message_params = {:from    => 'no-reply@sandbox3407e2df76274ee69f7ec89a064e1d8b.mailgun.org',
                      :to      =>  user["email"],
                      :subject => 'Smartibuy Digest',
                      :html    => template}

    # Send your message through the client
    mg_client.send_message "sandbox3407e2df76274ee69f7ec89a064e1d8b.mailgun.org", message_params
  end
end





File.open("filename.html", "w") do |aFile|
  aFile.puts template
end


puts "SOA_worker completed at #{Time.now}"

require 'bundler/setup'
Bundler.require :default
require 'net/http'
require 'json'

def http_get(url)
  puts "GET: #{url}"
  resp = Net::HTTP.get_response URI.parse "https://#{url}"
  resp.body
end

def page_get(url)
  page = http_get url
  Nokogiri::HTML page
end

get "/parse/*" do |url|
  content_type :json
  page = page_get url
  content = page.inner_text
  # puts content
  matches = content.scan /([13][a-km-zA-HJ-NP-Z0-9]{26,33})/
  # p matches
  matches = matches.uniq.flatten || []
  # puts matches
  { matches: matches }.to_json
end




# CSV.foreach("./data.csv") do |row|
#   puts row
# end

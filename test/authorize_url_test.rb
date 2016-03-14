require 'twitter_oauth_token'

require 'net/http'
require 'uri'

consumer_key = ENV['CONSUMER_KEY']
consumer_secret = ENV['CONSUMER_SECRET']

begin
  c = TwitterOAuthToken::consumer(consumer_key, consumer_secret)
  request_token = TwitterOAuthToken::request_token(c)
  url = TwitterOAuthToken::authorize_url(request_token)
  puts "get authorize url: #{url} ✅"

  url = URI.parse(url)
  req = Net::HTTP::Get.new url
  res = Net::HTTP.start(url.host, url.port, :use_ssl => url.scheme == 'https') {|http| http.request req}

  code = res.code
  print "authorize url status code: #{code} "
  if code == '200'
    puts '✅'
  else
    puts ''
    exit 1
  end
rescue => e
  puts "error: #{e}"
  exit 1
end

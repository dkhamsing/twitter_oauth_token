# Command line interface
module TwitterOAuthToken
  require 'twitter_oauth_token/get'
  require 'twitter_oauth_token/version'

  class << self
    def cli
      puts "#{PROJECT} #{VERSION}"
      puts 'Let\'s get that token in 4 easy steps!'
      results = get()

      error = results[RESULT_ERROR]

      if error.nil?
        access_token = results[RESULT_ACCESS_TOKEN]
        access_token_secret = results[RESULT_ACCESS_TOKEN_SECRET]

        puts "Token: #{access_token}"
        puts "Secret: #{access_token_secret}"
        puts '🎉'
      else
        puts "Error: #{error}"
      end
    end # cli
  end # class
end

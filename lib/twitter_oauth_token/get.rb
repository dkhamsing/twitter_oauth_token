# Get Twitter OAuth token
module TwitterOAuthToken
  require 'oauth'

  RESULT_ACCESS_TOKEN = 'access_token'
  RESULT_ACCESS_TOKEN_SECRET = 'access_token_secret'
  RESULT_ERROR = 'error'

  # prompt keys
  PROMPT_CONSUMER_KEY = 'consumer_key'
  PROMPT_CONSUMER_SECRET = 'consumer_secret'
  PROMPT_PIN = 'pin'
  PROMPT_OPEN_URL = 'open_url'

  # prompt defaults
  PROMPT_CONSUMER_KEY_DEFAULT = '[Step 1 of 4] consumer key: '
  PROMPT_CONSUMER_SECRET_DEFAULT = '[Step 2 of 4] consumer secret: '
  PROMPT_OPEN_URL_DEFAULT = '[Step 3 of 4] open this link in a browser (sign in and authorize): '
  PROMPT_PIN_DEFAULT = '[Step 4 of 4] enter pin: '

  class << self
    def consumer(consumer_key, consumer_secret)
      OAuth::Consumer.new(
        consumer_key,
        consumer_secret,
        :site => 'https://api.twitter.com'
      )
    end

    def request_token(consumer)
      consumer.get_request_token
    end

    def authorize_url(request_token)
      request_token.authorize_url
    end

    def access_token(request_token, pin)
      request_token.get_access_token(
        :oauth_token => request_token.token,
        :oauth_verifier => pin
      )
    end

    def get(prompts=nil)
      if prompts.nil?
        prompts = {
          PROMPT_CONSUMER_KEY => PROMPT_CONSUMER_KEY_DEFAULT,
          PROMPT_CONSUMER_SECRET => PROMPT_CONSUMER_SECRET_DEFAULT,
          PROMPT_OPEN_URL => PROMPT_OPEN_URL_DEFAULT,
          PROMPT_PIN => PROMPT_PIN_DEFAULT
        }
      end

      begin
        print prompts[PROMPT_CONSUMER_KEY]
        consumer_key = STDIN.gets.strip

        print prompts[PROMPT_CONSUMER_SECRET]
        consumer_secret = STDIN.gets.strip

        c = consumer(consumer_key, consumer_secret)

        request_token = request_token(c)

        url = authorize_url(request_token)
        puts "#{prompts[PROMPT_OPEN_URL]}#{url}"

        print prompts[PROMPT_PIN]
        pin = STDIN.gets.strip

        access_token = access_token(request_token, pin)

        {
          RESULT_ACCESS_TOKEN => access_token.token,
          RESULT_ACCESS_TOKEN_SECRET => access_token.secret,
          RESULT_ERROR => nil
        }
      rescue => e
        {
          RESULT_ACCESS_TOKEN => nil,
          RESULT_ACCESS_TOKEN_SECRET => nil,
          RESULT_ERROR => e
        }
      end # begin
    end
  end
end

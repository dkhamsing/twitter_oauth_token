# twitter_oauth_token

Gimme that Twitter OAuth access token!

[![Circle CI](https://img.shields.io/circleci/project/dkhamsing/twitter_oauth_token.svg)](https://circleci.com/gh/dkhamsing/twitter_oauth_token) [![Gem Version](https://badge.fury.io/rb/twitter_oauth_token.svg)](https://badge.fury.io/rb/twitter_oauth_token)

This is the library version of the [`get-twitter-oauth-token`](#credits) command line tool  :sweat_smile:

## Installation

```shell
$ gem install twitter_oauth_token
```

## Usage

```shell
$ irb
irb(main):001:0> require 'twitter_oauth_token'
=> true
irb(main):002:0> TwitterOAuthToken::get
[Step 1 of 4] consumer key: ...
[Step 2 of 4] consumer secret: ...
[Step 3 of 4] open this link in a browser (sign in and authorize): https://api.twitter.com/oauth/authorize?oauth_token=jKbOtQAAAAAAt_QtAAABU1NHQWU
[Step 4 of 4] enter pin: 1374423
=> {"access_token"=>"...", "access_token_secret"=>"...", "error"=>nil}
```

:tada:

### Custom Prompts

```ruby
prompts = {
  TwitterOAuthToken::PROMPT_CONSUMER_KEY => 'Enter Twitter app consumer key: ',
  TwitterOAuthToken::PROMPT_CONSUMER_SECRET => 'Enter Twitter app consumer secret: ',
  TwitterOAuthToken::PROMPT_OPEN_URL => 'Paste this URL in your browser: ',
  TwitterOAuthToken::PROMPT_PIN => 'What\'s the pin? '
}

TwitterOAuthToken::get(prompts)
# Enter Twitter app consumer key: ...
# ...
```

### Examples

- [test](https://github.com/dkhamsing/twitter_oauth_token/blob/master/test/authorize_url_test.rb)
- [`update_profile_pic`](https://github.com/dkhamsing/update_profile_pic)

## Credits

- [`get-twitter-oauth-token`](https://github.com/jugyo/get-twitter-oauth-token)

## Contact

- [github.com/dkhamsing](https://github.com/dkhamsing)
- [twitter.com/dkhamsing](https://twitter.com/dkhamsing)

## License

This project is available under the MIT license. See the [LICENSE](LICENSE) file for more info.

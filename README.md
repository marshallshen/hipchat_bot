# HipchatBot
Minimal Hipchat V2 API client

# Dependency
Ruby 2.1.3

## Why
Existing Hipchat Clients require external packages such as `httparty`,
it's an unnecessary dependency and can cause issues in managing project
packages. In fact, that was the motivation for me to create this simpler client.

This client is written with `no` production dependency of ruby gems and purely rely on
ruby utilities.

## Usage
### Step 1: configure Hipchat Bot
Use `configure` function let bot what is your room id and what is your
token, and what is your preferred text color:
```ruby
    HipchatBot.configure do |config|
      config["room_id"] = 90210
      config["auth_token"] = "GATTACA"
      config["text_color"] = "green"
    end
```
### Step 2: PROFIT!
Now use Hipchat Bot to braodcast and receive messages!
```ruby
HipchatBot.broadcast("say something I am cherishing you")
HipchatBot.receive
```

## Contribute
Currently the client only consumes two Hipchat endpoints to broadcast
and recieve messages from Hipchat room. Feel free to fork it, tweak it,
submit a PR!

### Run test
After `bundle install`, please run:
```
rspec hipchat_bot_spec.rb
```

# StayClassy

Stay Classy adds classes and ids to your html and html.erb files. You defind a prefix and the directories you wish to make classy and Stay Classy will add classes and ids to all of the HTML tags in the directory (unless specified Stay Classy will target every directory in app/views). 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'stay_classy'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install stay_classy

## Usage

Start by running the command:
```ruby
stay_classy
```
Then enter the prefix you wish to use. For example, a prefix of 'foo' sill produce tags like this inside of a directory named posts:
```html
<p class="foo_posts_p">Lorem ipsum...</p>
```
Ids are assigned a unique number along with the prefix and tag name.
```html
<p id="foo_p_15">Lorem ipsum...</p>
```

Keep in mind that stay_classy only targets plain HTML tags, not embedded Ruby.

You can also specify the directories you want to target. When prompted to enter the directories you wish to target simply type in the name. For example, to apply stay_classy to only app/views/posts and app/views/shared, type posts shared when asked which directories to target.

If you don't specify directories within your app/views folder all directories and files within app/views will be targeted by stay_classy

## Contributing

1. Fork it ( https://github.com/[my-github-username]/stay_classy/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

# restspec-rails

Integrates [Restspec](https://github.com/platanus/restspec) inside a Rails application. It won't need any url as with regular restspec use to work because it uses the Rails's internal integration framework to perform mock requests.

## Installation

Add it to your `Gemfile`:

```ruby
gem 'restspec-rails'
```

Install it (note: You need to have installed RSpec first):

```ruby
rails g restspec:install
```

It will generate a similar structure to the regular Restspec one.

## Some Caveats

### Rails throws too many Exceptions

The regular Restspec use usually have lines like this:

```ruby
it { should have_status(404) }
```

That assumes that the response will finish correctly. In test and development environments, Rails raises exceptions making RSpec to re-raise it and not allowing the test to finish. It's important, for this kind of tasks, that this setting is activated in `config/test.rb`:

```ruby
config.action_dispatch.show_exceptions = true
```

Another possible solution, more complex and difficult, inside this gem (so you don't have to change your `config/test` file) could be discussed in the future.

### "RSpec Controller Tests are a bit weird"

Rails controller unit tests can be seen as duplication by some people. So, for this people, you might want to disable the generation of specs alongside controllers. This can be done adding this in your `application.rb` file:

```ruby
config.generators do |g|
  g.controller_specs false
end
```

## Versioning

Only the initial version (`0.0.1`) follows Semantic Versioning. The next versions will follow the version of the Restspec gem included.

# Braise

Braise provides syntactic sugar for ruby's raise methods. 

## Installation

Add this line to your application's Gemfile:

    gem 'braise'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install braise

## Installing in Rails applications
Add braise to the Gemfile, then the easiest way to write an initializer that includes the Braise module and sets color scheme defaults:

```
# sample /config/initializers/braise.rb
include Braise

Braise.configure({:color => ANSI.white_on_green}) # set default color scheme
```

## Usage
Braise comes with 2 helper methods, `braise` and `craise`.

`braise` - short for "brief raise", eliminates the need for calling inspect on an object
```
braise obj # is equivalent to "raise obj.inspect"
```

`craise` - short for "colored raise", allows you to specify options for coloring terminal output
```
Braise.configure({:color => ANSI.white_on_green}) # this line can/should be done in an initializer
craise obj # will raise an exception using white text on a green background for terminal output
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

# Braise

Braise provides syntactic sugar for ruby's raise method. 

## Installation

Add this line to your application's Gemfile:

    gem 'braise'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install braise

Includes the Braise module and set color scheme defaults. (In rails applications, this should be in an initializer such as `/config/initializers/braise.rb`)
```
include Braise

Braise.configure({:color => ANSI.white_on_green}) # set default color scheme
```

## Usage
Braise comes with 2 helper methods, `braise` and `craise`.

`braise` - short for *brief raise*, eliminates the need for calling inspect on an object
```
braise obj # is equivalent to "raise obj.inspect"
```

`craise` - short for *colored raise*, allows you to specify options for coloring terminal output
```
# will raise an exception using white text on a red background for terminal output
# this is equivalent to "raise ANSI.white_on_red obj.inspect"
craise obj 
```

Braise uses the [ansi](https://github.com/rubyworks/ansi) gem for specifying font color on the terminal. See the [documentation](http://rubydoc.info/github/rubyworks/ansi/master/ANSI/Mixin) for a full list of available colors.

## Contributing

0. Check to see if the issue exists in the project's [tracker](https://github.com/MrAlexLau/braise/issues). 
1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

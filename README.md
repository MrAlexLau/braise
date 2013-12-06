# Braise

Braise is a tool to help debug ruby applications by providing shortcuts for ruby's raise method. 

Braise comes with 2 helper methods, `braise` and `craise`.

`braise` - short for *brief raise*, eliminates the need for calling inspect on an object
```
braise obj # is equivalent to "raise obj.inspect"
```

`craise` - short for *colorful raise*, allows you to specify options for coloring terminal output
```
# will raise an exception using white text on a red background for terminal output
# this is equivalent to "raise ANSI.white_on_red obj.inspect"
craise obj 
```

Braise uses the [ansi](https://github.com/rubyworks/ansi) gem for specifying font color on the terminal. See the [documentation](http://rubydoc.info/github/rubyworks/ansi/master/ANSI/Mixin) for a full list of available colors.

## Installation
### Ruby applications
On the command line, simply run:

    $ gem install braise

Then in the ruby program, be sure to require and include Braise:
```
require 'braise'
include Braise
```

See the `examples` folder for specific examples of the `braise` and `craise` methods.

### Rails applications
It is recommend that you put the braise gem in the `:development` group in the Gemfile:
```
  group :development do
    # ...other development gems
    gem 'braise'
  end
```

The gem will still work if you add it to top level of the Gemfile, but probably shouldn't be since Braise is intended to be used as a debugging tool.

And then execute:

    $ bundle

You must explicitly include the Braise module and set color scheme defaults. In rails applications, this should be in an initializer such as `/config/initializers/braise.rb`
```
if defined?(Braise) # check to make Braise is defined in the current environment
  include Braise # this line is required

  # set color scheme
  # the default color scheme is white_on_red
  Braise.configure({:color => ANSI.white_on_green}) 
end
```

## Contributing

0. Check to see if the issue exists in the project's [tracker](https://github.com/MrAlexLau/braise/issues). 
1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

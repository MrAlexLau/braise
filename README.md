# Braise

Braise is a tool to help debug ruby applications by providing shortcuts for the `raise` method.

Braise comes with 2 helper methods, `braise` and `craise`.

`braise` (short for *brief raise*) eliminates the need for calling inspect on an object
```
braise obj # is equivalent to "raise obj.inspect"
```

`craise` (short for *colorful raise*) allows you to specify options for coloring terminal output
```
# will raise an exception using white text on a red background for terminal output
# this is equivalent to "raise ANSI.white_on_red obj.inspect"
craise obj
```

Braise uses the [ansi](https://github.com/rubyworks/ansi) gem for specifying font color on the terminal. See ansi's [documentation](http://rubydoc.info/github/rubyworks/ansi/master/ANSI/Mixin) for a full list of available color schemes.

## Installation
### Ruby applications
On the command line, simply run:
```
$ gem install braise
```

Then in the ruby program, require braise:
```
require 'braise'
```

See the `examples` folder for specific examples of the `braise` and `craise` methods.

### Rails applications
It is recommended that you put the braise gem in the `:development` group of the Gemfile:
```
  group :development do
    # ...other development gems
    gem 'braise'
  end
```

The gem will still work if you add it to top level of the Gemfile, but probably shouldn't be since Braise is intended to be used as a debugging tool.

Then bundle per usual:

    $ bundle

If you'd like to override the default color scheme or set additional flags, you can use an initializer like `/config/initializers/braise.rb` :
```
if defined?(Braise) # check to make Braise is defined in the current environment
  # override the default color scheme, use white_on_green
  Braise::Settings.configure({:color => ANSI.white_on_green})
end
```

## Contributing

0. Check to see if the issue exists in the project's [tracker](https://github.com/MrAlexLau/braise/issues).
1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

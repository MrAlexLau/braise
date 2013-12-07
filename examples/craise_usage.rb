require 'braise'
require 'ansi'

include Braise

arr = [1, 2, 3]

# Braise.configure({:color => ANSI.red}) # set default font color to red
# Braise.configure({:color => ANSI.on_green}) # set default background color to green
Braise.configure({:color => ANSI.white_on_yellow}) # set default font color to white and background color to yellow

# raise an exception that writes colorful output to the terminal
# equivalent to "raise ANSI.on_green arr.inspect"
craise arr 

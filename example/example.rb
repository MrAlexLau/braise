require 'braise'
require 'ansi'
include Braise

arr = [1, 2, 3]

Braise.configure({:color => ANSI.on_green})
braise arr
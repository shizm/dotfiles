require 'irb/completion' rescue nil
require 'pp' rescue nil
require 'rubygems' rescue nil
require 'wirble' rescue nil

IRB.conf[:SAVE_HISTORY] = 100000

Wirble.init
Wirble.colorize

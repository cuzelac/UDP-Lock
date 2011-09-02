#!/usr/bin/env ruby

require 'socket'

# test the basic case
# enter the port you want to lock by as the first arg

lock = UDPSocket.new

begin
  lock.bind('127.0.0.1',ARGV[0])
  STDIN.gets
rescue Errno::EADDRINUSE
  puts "Lockport already in use on host"
  exit 1
end

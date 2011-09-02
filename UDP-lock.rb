#!/usr/bin/env ruby

require 'rubygems'
require 'socket'

class UDPLock < UDPSocket
  attr_reader :port, :ip

  def initialize(port, ip='127.0.0.1')
    super()
    @port = port
    @ip = ip

    grab
    close_read
  end

  # TODO(cuzelac): rescue more errors and more inteligent failure forms
  def grab
    begin
      bind(@ip,@port)
    rescue Errno::EADDRINUSE
      raise Errno::EADDRINUSE, "lock already taken"
    end
  end

  def clear
    close
  end

end

lck = UDPLock.new(12344)
puts lck.inspect
STDIN.gets

#!/bin/ruby

require 'daemons'

options = {
  app_name: 'monitor-daemon'
}

Daemons.run '/scripts/monitor-daemon.rb', options

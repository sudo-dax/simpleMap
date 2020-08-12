#!/bin/bash
## Welcome to the amazing stress-free Setup.file

echo 'Installing bundler'
gem install bundler

echo 'Adding Bundled Gems'
bundle add colorize
bundle add terminal-table
bundle add tty

echo 'Installing Bundled Gems'
bundle install

echo 'Starting Application'
ruby start.rb



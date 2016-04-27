#!/usr/bin/env ruby
#Enter log file as argument i.e: ./parser.rb ../logs/webserver.log

require_relative 'log_file'

log_file = LogFile.new(ARGV[0])

log_file.parse_file

puts "\nURL list with counts:\n#{log_file.display_url_counts}"

puts "\nURL List with uniq ip\n#{log_file.display_url_counts_with_uniq_ip}"

puts ""

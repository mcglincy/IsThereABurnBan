#!/usr/bin/ruby

require 'erb'
require 'JSON'
require 'ostruct'
require 'time'

STATUS_JSON_FILENAME = "ban_status.json"
OUTPUT_HTML_FILENAME = "foo.html"

status_json = JSON.parse(IO.read(STATUS_JSON_FILENAME))

under_ban = status_json["under_ban"]
last_modified_timestamp = status_json["last_modified_timestamp"]
last_modified_date = Time.at(last_modified_timestamp).to_datetime

erb_filename = under_ban ? "yes.html.erb" : "no.html.erb"
erb_file = File.open(erb_filename, 'r').read
erb = ERB.new(erb_file)

File.open(OUTPUT_HTML_FILENAME, 'w+') { |file| file.write(erb.result(binding)) }


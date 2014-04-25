#!/usr/bin/ruby

require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('http://www.co.travis.tx.us/fire_marshal/news/burn_ban.asp'))

# e.g.,
# <h2>Travis County is NOT under a Burn Ban</h2>
doc.css('h2').each do |link|
	if link.content.start_with?('Travis County')
		puts link.content
	end
end

# e.g.,
# <span class=timestamp>Last modified: 3/14/2014 4:08:54 PM</span>
doc.css('span.timestamp').each do |link|
	if link.content.start_with?('Last modified:')
		puts link.content
	end
end

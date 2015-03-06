require 'json'
require 'open-uri'

recipi_data = open(ARGV[0]).read
recipi_name = JSON.parse(recipi_data)

recipi_name.each do |list|
	print list[0] ,":", list[1], "\n" 
end

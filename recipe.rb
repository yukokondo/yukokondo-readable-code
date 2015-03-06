file = open(ARGV[0])
file.each {|recipe| print recipe}
file.close

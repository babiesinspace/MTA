require_relative 'structure.rb'

the_l = Line.new("L", ["6th Street", "8th Street", "Union Square", "3rd Ave", "1st Ave"], ["Union Square"])
the_n = Line.new("N", ["TImes Square", "34th Street", "28th Street", "23rd Street", "Union Square", "8th Street"], ["Union Square"])
the_6 = Line.new("6", ["Grand Central", "33rd Street", "28th Street", "23rd Street", "Union Square", "Astor Place"], ["Union Square"])

the_suck = MTA.new([the_l, the_n, the_6])

input = ARGV[0]

if input == 'lines'
  the_suck.lines
elsif input == 'stops'
  line = ARGV[1]
  the_suck.stop_list(line)
end 
  

the_suck.calculate_distance("L", "Union Square", "6", "Grand Central")
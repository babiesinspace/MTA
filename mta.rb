require_relative 'structure.rb'

station_key = {
  "6th" => "6th Street",
  "8th" => "8th Street",
  "union_square" => "Union Square",
  "3rd" => "3rd Ave",
  "1st" => "1st Ave",
  "times_square" => "Times Square",
  "34th" => "34th Street",
  "28th" => "28th Street",
  "23rd" => "23rd Street",
  "grand_central" => "Grand Central",
  "33rd" => "33rd Street",
  "astor_place" => "Astor Place"
}



the_l = Line.new("L", ["6th Street", "8th Street", "Union Square", "3rd Ave", "1st Ave"], ["Union Square"])
the_n = Line.new("N", ["Times Square", "34th Street", "28th Street", "23rd Street", "Union Square", "8th Street"], ["Union Square"])
the_6 = Line.new("6", ["Grand Central", "33rd Street", "28th Street", "23rd Street", "Union Square", "Astor Place"], ["Union Square"])

the_suck = MTA.new([the_l, the_n, the_6])

input = ARGV[0]

if input == 'lines'
  the_suck.lines
elsif input == 'stops'
  line = ARGV[1]
  the_suck.stop_list(line)
elsif input == 'calculate'
  starting_line = ARGV[1]
  starting_stop = station_key[ARGV[2]]
  ending_line = ARGV[3]
  ending_stop = station_key[ARGV[4]]
  the_suck.calculate_distance(starting_line, starting_stop, ending_line, ending_stop)
end 
  

# the_suck.calculate_distance("L", "Union Square", "6", "Grand Central")
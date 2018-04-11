class Line
  attr_reader :line, :line_name

  def initialize(line_name, stations_list, transfer_points)
    @line = {}
    @line_name = line_name 
    @stations_list = stations_list
    @transfer_points = transfer_points
    self.find_stop
  end

  def find_stop
    @stations_list.each_with_index do |station, i|
      stop = i + 1
      @line[station] = {stop: stop}
    end 
  end 

  def distance_from_transfer
    #find each transfer point stop number
    #iterate through stops and subtract transfer point stop from each stop
    #save the absolute value as the distance from transfer point
    #put in line hash
  end 

  def stops
    @line.keys.each { |stop| puts stop }
  end 

end 

the_l = Line.new("L Train", ["6th Street", "8th Street", "Union Square", "3rd Ave", "1st Ave"], ["Union Square"])
the_l.stops
puts the_l.line


#stations is a hash - each stop has a name (key) and a 2nd hash as a value, where each key is a transfer point, and each value the number of stops from that transfer point

# Ex:
# L-Line = {
#   "6th Street": {"stop": 1, "transfer-point": {"name": "Union Square", distance: 2}},
#   "8th Street": {"stop": 2, "Union Square": 1},
#   "Union Square": {"stop": 3, "Union Square": 0},
#   "3rd Ave": {"stop": 4, "Union Square": 1},
#   "1st Ave": {"stop": 5, "Union Square": 2},
# }

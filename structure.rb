class Line
  attr_reader :line, :line_name

  def initialize(line_name, stations_list, transfer_points)
    @line = {}
    @line_name = line_name 
    @stations_list = stations_list
    @transfer_points = transfer_points
    self.find_stop
    self.add_transfer_data
  end

  def find_stop
    @stations_list.each_with_index do |station, i|
      stop = i + 1
      @line[station] = {stop: stop}
    end 
  end 

  def add_transfer_data
    #find each transfer point stop number
    @transfer_points.each do |transfer|
      station_hash = @line[transfer]
      transfer_stop_number = station_hash[:stop]
      @line.keys.each do |station| 
    #iterate through stops and subtract transfer point stop from each stop
        station_stop_number = @line[station][:stop]
    #save the absolute value as the distance from transfer point
        distance = (station_stop_number - transfer_stop_number).abs
    #put in line hash
        # if @line[station][:transfer_point] == nil 
        #   @line[station][:transfer_point] = []
        # end 
        @line[station][:transfer_point] = {transfer => distance}
      end  
    end 
  end

  def distance_from_transfer(station, transfer_point)
    transfer_point_hash = @line[station][:transfer_point]
    if transfer_point_hash.has_key?(transfer_point)
      distance = transfer_point_hash[transfer_point]
    end 
    distance
  end 

  def stops
    @line.keys.each { |stop| puts stop }
  end

  def stop_number(station_name)
    @line[station_name][:stop]
  end 

end 

class MTA
  #trains (on initialize) should be an array of lines
  def initialize(trains)
    puts "Enter if you dare"
    @trains = {}
    trains.each do |line| 
      train_name = line.line_name 
      @trains[train_name] = line
    end 
  end

  def lines
    @trains.keys.each { |line| puts line} 
  end 

  def stop_list(line)
    line_instance = @trains[line]
    line_instance.stops
  end 

  def calculate_distance(starting_line, starting_stop, ending_line, ending_stop)
    if starting_line == ending_line
      distance = (@trains[starting_line].stop_number(starting_stop) - @trains[ending_line].stop_number(ending_stop)).abs
    else
      distance = @trains[starting_line].distance_from_transfer(starting_stop, "Union Square") + @trains[ending_line].distance_from_transfer(ending_stop, "Union Square")
    end 
      puts distance
  end 

end 



#stations is a hash - each stop has a name (key) and a 2nd hash as a value, where each key is a transfer point, and each value the number of stops from that transfer point

# Ex:
# L-Line = {
#   "6th Street": {"stop": 1, "transfer-point": [{"name": "Union Square", distance: 2}]},
#   "8th Street": {"stop": 2, "Union Square": 1},
#   "Union Square": {"stop": 3, "Union Square": 0},
#   "3rd Ave": {"stop": 4, "Union Square": 1},
#   "1st Ave": {"stop": 5, "Union Square": 2},
# }

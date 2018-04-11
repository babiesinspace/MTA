class Line
  attr_reader :line, :line_name

  def initialize(line_name, stations_list, transfer_points)
    @line = {}
    @line_name = line_name 
    @stations_list = stations_list
    @transfer_points = transfer_points
    self.find_stop
    self.distance_from_transfer
  end

  def find_stop
    @stations_list.each_with_index do |station, i|
      stop = i + 1
      @line[station] = {stop: stop}
    end 
  end 

  def distance_from_transfer
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
        if @line[station][:transfer_point] == nil 
          @line[station][:transfer_point] = []
        end 
        @line[station][:transfer_point].push({name: transfer, distance: distance})
      end  
    end 
  end

  def stops
    @line.keys.each { |stop| puts stop }
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


end 


the_l = Line.new("L Train", ["6th Street", "8th Street", "Union Square", "3rd Ave", "1st Ave"], ["Union Square"])
the_n = Line.new("N Train", ["TImes Square", "34th Street", "28th Street", "23rd Street", "Union Square", "8th Street"], ["Union Square"])
the_6 = Line.new("6 Train", ["Grand Central", "33rd Street", "28th Street", "23rd Street", "Union Square", "Astor Place"], ["Union Square"])

the_suck = MTA.new([the_l, the_n, the_6])
#the_suck.lines 
the_suck.stop_list("L Train")


#stations is a hash - each stop has a name (key) and a 2nd hash as a value, where each key is a transfer point, and each value the number of stops from that transfer point

# Ex:
# L-Line = {
#   "6th Street": {"stop": 1, "transfer-point": {"name": "Union Square", distance: 2}},
#   "8th Street": {"stop": 2, "Union Square": 1},
#   "Union Square": {"stop": 3, "Union Square": 0},
#   "3rd Ave": {"stop": 4, "Union Square": 1},
#   "1st Ave": {"stop": 5, "Union Square": 2},
# }

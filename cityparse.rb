require 'json'

data = {}
File.readlines('cities.txt').each do |line|
  if line.length > 1
    fields = line.split(' ')
    citystate = fields[-1].split(',')
    city = citystate[0].delete '\''
    state = citystate[1]
    if state && state.length > 0
      data[state] ||= {}
      data[state][:name] ||= state
      data[state][:cities] ||= []
      data[state][:cities] << {:name => city, :lat => fields[1].to_f, :lng => fields[2].to_f * -1.0}
    end
  end
end
data['VA'][:cities] << {:name => 'Reston', :lat => 38.96, :lng => -77.34}
data['VA'][:cities] << {:name => 'Arlington', :lat => 38.88, :lng => -77.10}
data['VA'][:cities] << {:name => 'Alexandria', :lat => 38.80, :lng => -77.04}
data['VA'][:cities] << {:name => 'TysonsCorner', :lat => 38.91, :lng => -77.23}
data['PA'][:cities] << {:name => 'Norristown', :lat => 40.12, :lng => -75.33}
data['PA'][:cities] << {:name => 'Royersford', :lat => 40.18, :lng => -75.51}
data['PA'][:cities] << {:name => 'Limerick', :lat => 40.22, :lng => -75.53}
data['PA'][:cities] << {:name => 'Linfield', :lat => 40.21, :lng => -75.57}
data['DE'][:cities] << {:name => 'Newark', :lat => 39.68, :lng => -75.75}
data['DE'][:cities] << {:name => 'Rehoboth', :lat => 38.72, :lng => -75.07}
data['DE'][:cities] << {:name => 'BroadkillBeach', :lat => 38.81, :lng => -75.20}
data['DE'][:cities] << {:name => 'Lewes', :lat => 38.77, :lng => -75.14}
data['FL'][:cities] << {:name => 'Bradenton', :lat => 27.50, :lng => -82.57}
data['FL'][:cities] << {:name => 'BradentonBeach', :lat => 27.47, :lng => -82.70}
data['FL'][:cities] << {:name => 'AnnaMaria', :lat => 27.53, :lng => -82.73}
data['FL'][:cities] << {:name => 'LongboatKey', :lat => 27.41, :lng => -82.66}
data['MA'][:cities] << {:name => 'Cambridge', :lat => 42.37, :lng => -71.10}
data['MA'][:cities] << {:name => 'Brookline', :lat => 42.33, :lng => -71.12}
data['MA'][:cities] << {:name => 'Lexington', :lat => 42.44, :lng => -71.22}
data['MA'][:cities] << {:name => 'Concord', :lat => 42.46, :lng => -71.34}
data['NH'][:cities] << {:name => 'NorthConway', :lat => 44.05, :lng => -71.13}
data['RI'][:cities] << {:name => 'Newport', :lat => 41.49, :lng => -71.31}
data['DC'][:cities] << {:name => 'Washington', :lat => 38.90, :lng => -77.04}
data['NY'][:cities] << {:name => 'NewYork/Bronx', :lat => 40.84, :lng => -73.87}
data['NY'][:cities] << {:name => 'NewYork/Brooklyn', :lat => 40.65, :lng => -73.95}
data['NY'][:cities] << {:name => 'NewYork/Queens', :lat => 40.74, :lng => -73.77}
data['NJ'][:cities] << {:name => 'OceanCity', :lat => 39.26, :lng => -74.60}
data['HI'][:cities] << {:name => 'Honolulu', :lat => 21.31, :lng => -157.86}
data['HI'][:cities] << {:name => 'WaikikiBeach', :lat => 21.27, :lng => -157.83}
data['HI'][:cities] << {:name => 'Lahaina', :lat => 20.88, :lng => -156.68}
data_a = []
data.each_value do |state|
  data_a << state
end
data_a.each do |s|
  s[:cities].sort! do |x, y|
    x[:name] <=> y[:name]
  end
end
File.write('cities.js', 'var cityData = JSON.parse(\'' + data_a.to_json + '\')')
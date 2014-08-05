# class to store cities
class City
  attr_accessor :name, :visited, :roads, :cost
  attr_reader :id

  @@cities = [] # all created cities

  def initialize id, name
    @id = id
    @name = name
    @roads = {}
    @@cities << self
  end

  def add_road to, cost
    @roads[to] = cost
  end

  def self.all
    @@cities
  end

  #find city by id
  def self.find id
    @@cities.find {|city| city.id == id}
  end

  #find city by name
  def self.find_by_name name
    @@cities.find {|city| city.name == name}
  end

  def self.reset
    @@cities = []
  end

  # help block
  def print
    puts "========================================================"
    puts "Название города №#{id} - #{name}"
    puts "у него #{roads.count} городов - соседей:"
    roads.each do |index, cost|
      city = City.find(index)
      puts "ID:#{city.id} Название:#{city.name} -> стоимость пути #{cost}"
    end
    puts "========================================================"
  end
end

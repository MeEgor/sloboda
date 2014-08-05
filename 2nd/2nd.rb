require './city.rb'
require './deixtra.rb'

show_exapmle = true
pathes = []

print "Введите количество тестов, которые нужно провести: "
testCount = gets.to_i

testCount.times do |testNumber|
  testNumber = testNumber + 1
  puts "Введите данные для теста № #{testNumber}"


  print "Введите количество городов: "
  citiesCount = gets.to_i

  puts ''
  puts "========================================================"
  puts "                        Города                          "
  puts "========================================================"
  puts ''

  citiesCount.times do |cityIndex|
    index = cityIndex + 1
    print "Название города №#{index}: "

    name = gets.chomp
    city = City.new(index, name)

    print "Количество городов-соседей для города №#{city.id} #{city.name}: "
    countOfNeighbours = gets.to_i

    if show_exapmle
      puts ''
      puts "=================== ИНСТРУКЦИЯ ========================="
      puts "Введите ID города-соседа и стоимость пудти до него"
      puts "например:"
      puts "1 12"
      puts "значит, что до города с ID 1 стоимость пути 12"
      puts "===================   КОНЕЦ    =========================="
      puts ''
      show_exapmle = false
    end

    puts "Ввод сосдей для города #{city.name}"

    countOfNeighbours.times do |i|
      print "введите ID и стоимость для города-соседа №#{i + 1}: "
      params = gets
      params = params.split(' ')
      city.add_road(params.first.to_i, params.last.to_i)
    end
    puts "========================================================"
  end

  puts "=                    Ввод окончен                      ="
  puts "=            Проверьте правильность ввода              ="
  puts "========================================================"
  puts ''

  City.all.each do |c|
    c.print
  end

  print "Сколько путей надо найти?: "
  pathCount = gets.to_i
  puts "Введите начальную и конечную точки через пробел"
  puts "Например: qwe asd"

  pathCount.times do |i|
    print "Путь №#{i+1}: "
    params = gets
    params = params.split(' ')
    pathes[i] = [params[0], params[1]]
  end

  d = Deixtra.new
  City.all.each do |city|
    d.add_vertex(Deixtra::Vertex.new city)
  end

  pathes.each do |path|
    from = City.find_by_name(path[0])
    to = City.find_by_name(path[1])
    path_length = d.process from.id, to.id
    puts "Расстояние от #{from.name} до #{to.name} - #{path_length}"
    d.reset
  end

  show_exapmle = true
  pathes = []
  City.reset
  puts ''
end






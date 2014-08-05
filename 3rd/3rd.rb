# simple multiple
# where a is array like [1,2,3], and b from 0 to 9, function returns an array

#   123
#     9
#   ---
#  1107

# simple_multiple([1,2,3], 9) returns [1,1,0,7]
def simple_multiple a, b
  buffer = 0
  answer = []
  i = 1  # iterations count
  while !a[-i].nil? do # start from last element
    c = a[-i].to_i * b + buffer
    answer.unshift c % 10 # unities
    buffer = c / 10 # tens
    i += 1
  end
  answer.unshift buffer if buffer > 0
  answer
end


# simple summ
# where a anb are arrays, like [1,2,3], function returns an array

#  123
#  123
#  ---
#  246

# summ([1,2,3], [1,2,3]) returns [2,4,6]
def summ a, b
  buffer = 0
  i = 1
  answer = []
  while !a[-i].nil? || !b[-i].nil?
    # correct one of arrays if it's shorter, then other
    a.unshift(0) if a[-i].nil?
    b.unshift(0) if b[-i].nil?
    c = a[-i] + b[-i] + buffer
    answer.unshift c % 10 # unities
    buffer = c / 10 # tens
    i += 1
  end
  answer.unshift buffer if buffer > 0
  answer
end

# advanced multiple
# where a anb are arrays, like [1,2,3], function returns an array

#    123
#     99
#    ---
#   1107
#  1107
#  -----
#  12177

# simple_multiple([1,2,3], [9,9]) returns [1,2,1,7,7]
def multiple a, b
  answer = [0]
  buffer = []
  i = 1

  while !b[-i].nil?
    buffer = simple_multiple(a, b[-i].to_i)
    (i-1).times do
      buffer.push 0
    end
    answer = summ(answer, buffer)
    buffer = []
    i += 1
  end

  answer
end

#factotial(5), returns [1,2,0]
def factorial n
  answer = [1]
  for i in 1..n
    # 99.to_s.scan(/./) = ['9','9']
    answer = multiple(answer, i.to_s.split(''))
  end
  answer
end

def print_hard_factorial_summ n
  start = Time.now
  sum = 0
  factorial(n).each do |i|
    sum += i
  end
  finish = Time.now
  puts "Hard way....... calculation time: #{finish - start}"
  puts sum
end

# =================== OR 100 times shorter ===============================

def print_easy_factorial_summ n
  start = Time.now
  x = (n).downto(1).inject(:*) # n!
  sum = 0
  sum = x.to_s.split('').inject(0) {|a1, a2| a1 + a2.to_i }
  finish = Time.now

  puts "Easy way! Calculation time: #{finish - start}"
  puts sum
end

print_hard_factorial_summ 100
puts '======================='
print_easy_factorial_summ 100

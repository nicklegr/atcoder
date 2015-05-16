require 'pp'

# http://0xcc.net/ruby-bsearch/index.html.ja
# require './bsearch'

# https://github.com/kanwei/algorithms
# require 'rubygems'
# require 'algorithms'
# include Containers

def ppd(*arg)
  if $DEBUG
    pp(*arg)
  end
end

def putsd(*arg)
  if $DEBUG
    puts(*arg)
  end
end

def ri
  readline.to_i
end

def ris
  readline.split.map do |e| e.to_i end
end

def rs
  readline.chomp
end

def rss
  readline.chomp.split
end

def rf
  readline.to_f
end

def rfs
  readline.split.map do |e| e.to_f end
end

def rws(count)
  words = []
  for i in 1 .. count
    words << readline.chomp
  end
  words
end

a, b = rs.split('/')

a = a.to_i
b = b.to_i

val = a.to_f / b

n = 1

found = false

upper = Math.sqrt(2 * val + 2)
upper = upper.ceil.to_i

while n <= upper
  # m = (n * (n+1) / 2 - val) * n
  # m = (n * n * (n+1) / 2 - val * n)
  u = a * n
  if u % b != 0
    n += 1
    next
  end

  m = n * (n+1) / 2 - u / b
  if m < 0
    n += 1
    next
  end

  puts "#{n} #{m}"
  found = true

  n += 1
end

if !found
  puts "Impossible"
end

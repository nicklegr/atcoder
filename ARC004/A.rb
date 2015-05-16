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

# main
t_start = Time.now

# readline().chomp
# readline().split

n = ri

ps = []

n.times do
  ps << ris
end

max_d = 0

# pp ps

for i in 0..n-1
  a = ps[i]
  for j in 0..n-1
    b = ps[j]
    d = Math.sqrt((b[0] - a[0]).abs ** 2 + (b[1] - a[1]).abs ** 2)
    max_d = d if d > max_d
  end
end

puts max_d

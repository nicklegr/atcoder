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

x, y, w = rss
x = x.to_i - 1
y = y.to_i - 1

tbl = rws(9)

dx = dy = 0

dx = -1 if w =~ /L/
dx = 1 if w =~ /R/
dy = -1 if w =~ /U/
dy = 1 if w =~ /D/

ans = ''

for i in 0..3
  ans += tbl[y][x]
  
  dx = -1 if x == 8 && dx == 1
  dx = 1 if x == 0 && dx == -1

  dy = -1 if y == 8 && dy == 1
  dy = 1 if y == 0 && dy == -1

  x += dx
  y += dy
end

puts ans

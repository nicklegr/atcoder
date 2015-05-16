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


h, w = ris
map = rws(h)


V = w * h

INF = 99999999
cost = []
V.times do
  cost << Array.new(V, INF)
end

# calc cost
for y in 0 .. h-1
  for x in 0 .. w-1
    for i in [-1, 0, +1]
      for j in [-1, 0, +1]
        next if i == j
        px = x + j
        py = y + i
        next if py >= h || px >= w || py < 0 || px < 0

        cur = y*w + x
        nex = py*w + px
        cost[cur][nex] = map[py][px] == '#' ? 1 : 0
      end
    end
  end
end

d = Array.new(V, INF)
used = Array.new(V, false)

sx = sy = 0
map.each_with_index do |row, y|
  x = 0
  row.each_char do |c|
    if c == 's'
      sx = x
      sy = y
    end
    x += 1
  end
end

gx = gy = 0
map.each_with_index do |row, y|
  x = 0
  row.each_char do |c|
    if c == 'g'
      gx = x
      gy = y
    end
    x += 1
  end
end

d[sy*w + sx] = 0

loop do
  v = -1
  for u in 0 .. V-1
    if !used[u] && (v == -1 || d[u] < d[v])
      v = u
    end
  end
    
  break if v == -1
  
  used[v] = true
  
  for u in 0 .. V-1
    a = d[u]
    b = d[v] + cost[v][u]
    d[u] = a < b ? a : b
  end
end

puts d[gy*w + gx] <= 2 ? 'YES' : 'NO'

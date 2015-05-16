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

c = ri
str = rs
min = 9999999

for a in ["A", "B", "X", "Y"]
  for b in ["A", "B", "X", "Y"]
    for c in ["A", "B", "X", "Y"]
      for d in ["A", "B", "X", "Y"]
        l = a + b
        r = c + d
        
        s = str.gsub(/#{l}|#{r}/, "L")
        if s.size < min
          min = s.size
        end
      end
    end
  end
end

puts min

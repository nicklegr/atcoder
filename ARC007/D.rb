require 'pp'

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

given = rs

for first in 1..99999
  for diff in 1..99999
    s = first.to_s
    cur = first
    while s.size <= 6 + 5
      cur += diff
      s += cur.to_s
    end
    
    pos = s.index(given)
    if pos && pos < first.to_s.size
      puts "#{first} #{diff}"
      exit
    end
  end
end

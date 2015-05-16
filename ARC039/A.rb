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

def parr(arr)
  puts arr.join(" ")
end

def parrd(arr)
  putsd arr.join(" ")
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
  count.times do
    words << readline.chomp
  end
  words
end

a, b = ris
max = a - b

for i in 0..2
  for j in 0..9
    a_s = a.to_s
    a_s[i] = j.to_s
    next if a_s.to_i < 100
    v = a_s.to_i - b
    if max < v
      max = v
    end
  end
end

for i in 0..2
  for j in 0..9
    b_s = b.to_s
    b_s[i] = j.to_s
    next if b_s.to_i < 100
    v = a - b_s.to_i
    if max < v
      max = v
    end
  end
end

puts max

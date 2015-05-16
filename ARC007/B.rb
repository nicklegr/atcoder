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

n, m = ris

plays = []

m.times do
  plays << ri
end

cases = []

for i in 0..n
  cases << i
end

cur = 0

plays.each do |e|
ppd e

  if cur != e
    for i in 0..n
      if cases[i] == e
        cases[i] = cur
        cases[0] = e
        cur = e
        break
      end
    end
  end
  ppd cases
end

for i in 1..n
  puts cases[i]
end

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

def toi(s)
  si = 0
  
  s.reverse.each_char do |e|
    if e == 'o'
      si |= 1
    else
      si |= 0
    end
    si <<= 1
  end
  si >>= 1

ppd si

  ret = 0
  l = 0
  while l <= 32
    ret |= si << l
    l += s.size
  end

  ret
end

def check(v)
  c = 0
  max = 0
  while v != 0
    if (v & 1) == 1
      c += 1
      max = c > max ? c : max
    else
      c = 0
    end
    v >>= 1
  end
  return max >= 20
end

def solve(cur_v, v, s, lim)
  return false if lim == 0
  
  for i in s..9
    next_v = cur_v | (v << i)
    return true if check(next_v)

    if solve(next_v, v, i + 1, lim - 1)
      return true
    end
  end

  return false
end

pat = rs

v = toi(pat)

ppd v

if check(v)
  puts 1
else
  for i in 1..10
    if solve(v, v, 0, i)
      puts i + 1
      break
    end
  end
end

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

def get(arr, p)
  arr[p[1]][p[0]]
end

def dec(arr, p)
  arr[p[1]][p[0]] -= 1
end

def in_field(p)
  x = p[0]
  y = p[1]
  0 <= x && x < 30 && 0 <= y && y < 30
end

def out(p)
  puts "#{p[1]+1} #{p[0]+1}"
end

def reset(arr)
  for y in 0...30
    for x in 0...30
      p = [x,y]
      if get(arr, p) >= 1
        # if x != 29
          return [x,y]
        # else
        #   return [x-1,y]
        # end
      end
    end
  end
end

def walk(arr, cur)
  n = [
    [cur[0]-1, cur[1]],
    [cur[0]+1, cur[1]],
    [cur[0], cur[1]-1],
    [cur[0], cur[1]+1],
  ]
  n.select! do |e|
    in_field(e) && get(arr, e) >= 1
  end

  n.sample
end

def p_arr(arr)
  arr.each do |e|
    STDERR.print e.join(" ") + "\n"
  end
end

# main
t_start = Time.now

cases = 1

(1 .. cases).each do |case_index|
  arr = []
  30.times do
    arr << ris
  end

  total = 0
  for i in 0...30
    total += arr[i].inject(:+)
  end

  turn = 0
  cur = [0,0]
  count = 0
  loop do
    break if count == total
    x = cur[0]
    y = cur[1]

    cur = walk(arr, cur)
    if cur != nil
      out(cur)
      dec(arr, cur)
      count += 1
      next
    end

turn += 1
# p_arr(arr)

    cur = [x,y]
    if in_field(cur) && get(arr, cur) >= 1
      out(cur)
      dec(arr, cur)
      count += 1
      next
    end

    # reset
    cur = reset(arr)
  end

  # check
  for y in 0...30
    for x in 0...30
      raise if get(arr, [x,y]) != 0
    end
  end

  STDERR.puts "turn: #{turn}"

  # progress
  trigger = 
    if cases >= 10
      case_index % (cases / 10) == 0
    else
      true
    end

  if trigger
    STDERR.puts("case #{case_index} / #{cases}, time: #{Time.now - t_start} s")
  end
end

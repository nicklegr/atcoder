require 'pp'

$count = 0
$last = nil
$turn = 0

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

def out(p)
  puts "#{p[1]+1} #{p[0]+1}"
end

def get(arr, p)
  arr[p[1]][p[0]]
end

def dec(arr, p)
  raise unless arr[p[1]][p[0]] > 0

  if $last
    if ($last[0][0] - p[0]).abs + ($last[0][1] - p[1]).abs == 1 &&
      $last[1] - 1 == arr[p[1]][p[0]]
      # 同一ターン
    else
      $turn += 1
    end
  end
  $last = [p, arr[p[1]][p[0]]]

  out(p)
  arr[p[1]][p[0]] -= 1
  $count += 1
end

def in_field(p)
  x = p[0]
  y = p[1]
  0 <= x && x < 30 && 0 <= y && y < 30
end

def reset(arr)
  for y in 0...30
    for x in 0...30
      p = [x,y]
      if get(arr, p) >= 1
        return [x,y]
      end
    end
  end
  nil
end

def walk(arr, cur, th, route)
  n = [
    [cur[0]-1, cur[1]],
    [cur[0]+1, cur[1]],
    [cur[0], cur[1]-1],
    [cur[0], cur[1]+1],
  ]
  n.select! do |e|
    in_field(e) && get(arr, e) >= th && !route.include?(e)
  end

  n.first
end

def p_arr(arr)
  arr.each do |e|
    putsd e.join(" ")
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

  $turn = 0
  $count = 0
  loop do
    break if $count == total

    cur = reset(arr)
    break if !cur

    # ルートを延ばす
    route = [cur]
    th = get(arr, cur) - 1
    while th > 0
      cur = walk(arr, cur, th, route)
      if cur != nil
        th -= 1
        route << cur
      else
        break
      end
    end

    # 1ずつ減っていくように事前に減らす
    th = get(arr, route.first)
    route.each do |e|
      t = get(arr, e) - th
      raise unless t >= 0
      t.times do
        dec(arr, e)
      end
      th -= 1
    end

    # 連番処理(0になったらスキップ)
    loop do
      deced = false
      route.each do |e|
        if get(arr, e) > 0
          dec(arr, e)
          deced = true
        end
      end
      break if !deced
    end

putsd "------"
p_arr(arr)
  end

  # check
  for y in 0...30
    for x in 0...30
      raise if get(arr, [x,y]) != 0
    end
  end

putsd "turn: #{$turn}"

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

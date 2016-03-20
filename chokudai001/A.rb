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
  if !$DEBUG
    puts "#{p[1]+1} #{p[0]+1}"
  end
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

def start(arr, th)
  for y in 0...30
    for x in 0...30
      p = [x,y]
      if get(arr, p) >= th
        return [x,y]
      end
    end
  end
  nil
end

def start_once(arr, th, used)
  for y in 0...30
    for x in 0...30
      p = [x,y]
      if get(arr, p) >= th && !used.key?(p)
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

def make_dec_array(arr, route)
parrd(route.map{|e| "[#{e[0]},#{e[1]}]"})
parrd(route.map{|e| get(arr, e)})

  # 1ずつ減っていくように事前に減らす
  th = get(arr, route.first)
  target = th - (route.size - 1)

  r_route = route.reverse

  loop do
    if get(arr, r_route.first) == target
      r_route.shift
    end

    break if r_route.empty?

    dec_list = []
    cur = get(arr, r_route.first)
    r_route.each do |e|
      break if get(arr, e) != cur
      dec_list << e
      cur += 1
    end

    dec_list.reverse.each do |e|
      dec(arr, e)
    end
  end

parrd(route.map{|e| "[#{e[0]},#{e[1]}]"})
parrd(route.map{|e| get(arr, e)})
end

def p_arr(arr)
  arr.each do |e|
    putsd e.map{|v| sprintf("%2d", v) }.join(" ")
  end
end

# main
t_start = Time.now

cases = 1

(1 .. cases).each do |case_index|
  $turn = 0
  $count = 0

  arr = []
  30.times do
    arr << ris
  end

  total = 0
  for i in 0...30
    total += arr[i].inject(:+)
  end

  LIMIT = 50

  # LIMIT以上のマスをLIMITに揃える
  start_used = {}
  loop do
    cur = start_once(arr, LIMIT, start_used)
    start_used[cur] = 1
    break if !cur

    # ルートを延ばす
    # @todo 最初のやつを隣のやつ+1まで減らす
    # @todo 探索やらDPで最長を探す
    route = [cur]
    th = get(arr, cur) - 1
    while th > LIMIT
      cur = walk(arr, cur, th, route)
      if cur != nil
        th -= 1
        route << cur
      else
        break
      end
    end

    make_dec_array(arr, route)

    # 連番処理(最後から順に0になる。最初が0になったら終了)
# parrd(route.map{|e| "[#{e[0]},#{e[1]}]"})
# parrd(route.map{|e| get(arr, e)})
    loop do
      deced = false
      route.each do |e|
        raise if get(arr, e) < LIMIT
        if get(arr, e) > LIMIT
          dec(arr, e)
          deced = true
        end
      end
      break if !deced
    end

putsd "------"
# p_arr(arr)
  end

p_arr(arr)
putsd "turn: #{$turn}"

  loop do
    break if $count == total

    cur = start(arr, LIMIT)
    cur = start(arr, 1) if !cur
    break if !cur

    # ルートを延ばす
    # @todo 最初のやつを隣のやつ+1まで減らす
    # @todo 探索やらDPで最長を探す
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

    make_dec_array(arr, route)

    # 連番処理(最後から順に0になる。最初が0になったら終了)
# parrd(route.map{|e| "[#{e[0]},#{e[1]}]"})
# parrd(route.map{|e| get(arr, e)})
    loop do
      deced = false
      route.each do |e|
        raise if get(arr, e) < 0
        if get(arr, e) > 0
          dec(arr, e)
          deced = true
        end
      end
      break if !deced
    end

putsd "------"
# p_arr(arr)
  end

  # check
  for y in 0...30
    for x in 0...30
      raise if get(arr, [x,y]) != 0
    end
  end

putsd "turn: #{$turn} (best: 24225)"

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

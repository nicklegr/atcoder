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

def read_floats()
  readline().split.map{|e| e.to_f }
end

def read_words(count)
  words = []
  for i in 1 .. count
    words << readline().chomp
  end
  words
end

# main
t_start = Time.now

# ‚±‚±‚©‚ç–â‘è‚É‰‚¶‚Ä
cases = readline().to_i

str = rs

tbl = { 1 => 0, 2 => 0, 3 => 0, 4 => 0 }

str.each_char do |e|
  tbl[e.to_i] += 1
end

min = tbl.values.min
max = tbl.values.max

puts "#{max} #{min}"

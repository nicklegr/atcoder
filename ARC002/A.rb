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

# main
t_start = Time.now

# ‚±‚±‚©‚ç–â‘è‚É‰‚¶‚Ä

y = ri

if y % 400 == 0
  puts "YES"
elsif y % 100 == 0
  puts "NO"
elsif y % 4 == 0
  puts "YES"
elsif
  puts "NO"
end

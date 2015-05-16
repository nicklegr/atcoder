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

(1 .. cases).each do |case_index|
  # readline().chomp
  # readline().split

  puts "Case ##{case_index}: #{answer}"

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

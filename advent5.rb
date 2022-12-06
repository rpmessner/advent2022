require 'active_support/all'
require 'pry'

adv5 = File.open("advent5").read
stackrx = /(\[[A-Z]\]|\s{4})/

diagram, moves = adv5.split("\n").split("")

create_stacks = proc {
  diagram[0..-2].reduce((1..9).map {[]}) {|coll, line|
    line.scan(stackrx).each_with_index do |(itm), idx|
      coll[idx].unshift(itm) if itm.strip != ""
    end

    coll
  }
}

def move1(stacks, number, src, dest)
  moving = stacks[src].last(number)
  stacks[src] = stacks[src][0..-(number + 1)]
  stacks[dest] += moving.reverse
end

def move2(stacks, number, src, dest)
  moving = stacks[src].last(number)
  stacks[src] = stacks[src][0..-(number + 1)]
  stacks[dest] += moving
end

stacks = moves.reduce(create_stacks.call) do |stacks, move|
  number, src, dest = move.scan(/move (\d+) from (\d+) to (\d+)/).first.map(&:to_i)
  move1(stacks, number, src - 1, dest - 1)
  stacks
end

puts stacks.map(&:last).map(&:chars).map(&:second).join

stacks = moves.reduce(create_stacks.call) do |stacks, move|
  number, src, dest = move.scan(/move (\d+) from (\d+) to (\d+)/).first.map(&:to_i)
  move2(stacks, number, src - 1, dest - 1)
  stacks
end

puts stacks.map(&:last).map(&:chars).map(&:second).join

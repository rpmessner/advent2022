adv4 = File.open("advent4").read

to_array = proc do |assignment|
  first, last = assignment.split("-")
  (first.to_i..last.to_i).to_a
end

part1 = adv4.split("\n").map {|row|
  a1, a2 = row.split(",").map(&to_array)
  [a1.size, a2.size].include?(a1.intersection(a2).size) ? 1 : 0
}.sum

puts "Part1: #{part1}"

part2 = adv4.split("\n").map {|row|
  a1, a2 = row.split(",").map(&to_array)
  a1.intersection(a2).size > 0 ? 1 : 0
}.sum

puts "Part2: #{part2}"

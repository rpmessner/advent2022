av3 = File.open("advent3").read

priority = proc do |char|
  if ("a".."z").include?(char) then char.ord - 96
  elsif ("A".."Z").include?(char) then char.ord - 38
  else puts "ERROR char: #{char}"
  end
end

bag_compartments = proc do |bag|
  bag.split("").each_slice((bag.size/2.0).round).to_a
end

duplicate = proc do |compartments|
  comp1, comp2 = compartments
  comp1.intersection(comp2).first
end

p1 = av3.split("\n").map(&bag_compartments).map(&duplicate).map(&priority).sum
puts  "Sum1: #{p1}"

p2 = av3.split("\n").map{|bag| bag.split("")}.each_slice(3).to_a.map do |(bag1, bag2, bag3)|
  bag1.intersection(bag2, bag3).first
end.map(&priority).sum

puts "Sum2: #{p2}"

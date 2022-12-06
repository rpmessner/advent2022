require 'active_support/all'
av1 = File.open("advent1").read
puts av1.split("\n").split("").map{|x| x.map(&:to_i)}.map(&:sum).last

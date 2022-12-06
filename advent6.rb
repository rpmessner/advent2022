require 'pry'

adv6 = File.open("advent6").read

def detect_message_position(message, tag_length)
  message.split("").reduce([[], 0]) { |(coll, count), val|
    if coll.size < tag_length
      new_coll =
        if coll.include?(val)
          idx = coll.index(val) + 1
          [*coll[idx..-1], val]
        else
          [*coll, val]
        end
      [new_coll, count + 1]
    else
      [coll, count]
    end
  }.last
end

puts detect_message_position(adv6, 4)

puts detect_message_position(adv6, 14)


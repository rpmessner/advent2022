require 'active_support/all'
av2 = File.open("advent2").read
def score1(opponent, mine)
  outcome =
    case [opponent,mine]
    when ["A","X"], ["B","Y"], ["C","Z"] then 3
    when ["A","Y"], ["B","Z"], ["C","X"] then 6
    else 0
    end
  move_score(mine) + outcome
end

def move_score(move)
  ["X","Y","Z"].index(move) + 1
end

puts av2.split("\n").map{|x|x.split(" ")}.map{|(o,m)|score1(o,m)}.sum

def move_for_result(opponent, result)
  if result == "Y"
    ["X","Y","Z"][["A","B","C"].index(opponent)]
  else
    case [opponent, result]
    when ["A", "X"] then "Z"
    when ["A", "Z"] then "Y"
    when ["B", "X"] then "X"
    when ["B", "Z"] then "Z"
    when ["C", "X"] then "Y"
    when ["C", "Z"] then "X"
    end
  end
end

def score2(opponent, result)
  outcome_score = [0,3,6][["X","Y","Z"].index(result)]
  move = move_for_result(opponent, result)
  move_score(move) + outcome_score
end

puts av2.split("\n").map{|x|x.split(" ")}.map{|(o,r)|score2(o,r)}.sum


def check(d)
  while true do
    while true do
      found_and = false
      d.keys.combination(2){ |a|
        v = a[0] & a[1]
        unless d[v]
          d[v] = "(#{d[a[0]]} & #{d[a[1]]})"
          found_and = true
        end
      }
      break unless found_and
    end
    
    while true do
      found_or = false
      d.keys.combination(2){ |a|
        v = a[0] | a[1]
        unless d[v]
          d[v] = "(#{d[a[0]]} | #{d[a[1]]})"
          found_or = true
        end
      }
      break unless found_or
    end

    break unless found_and || found_or
  end

  d
end

d1 = {}
d1[0b01010101] = '0b01010101'
d1[0b00110011] = '0b00110011'
d1[0b00001111] = '0b00001111'
d1[0b01010101] = 'A'
d1[0b00110011] = 'B'
d1[0b00001111] = 'C'

d1 = check(d1)

d1.keys.each { |v|
  d2 = d1.dup
  d2[v ^ 0b11111111] = "(inv(#{d1[v]}))"
  d2 = check(d2)
  d2.keys.each { |v|
    d3 = d2.dup
    d3[v ^ 0b11111111] = "(inv(#{d2[v]}))"
    d3 = check(d3)
    if d3[0b10101010] && d3[0b11001100] && d3[0b11110000]
      print <<EOF
def inv(v)
  0b11111111 ^ v
end

A = 0b01010101
B = 0b00110011
C = 0b00001111

puts '10101010'
puts sprintf('%08b',#{d3[0b10101010]})
puts '11001100'
puts sprintf('%08b',#{d3[0b11001100]})
puts '11110000'
puts sprintf('%08b',#{d3[0b11110000]})
EOF
      exit
    end
  }
}


#while true do
#  現状の集合すべての組み合わせについてandを計算したのを追加
#   while true do
#     現状の集合すべての組み合わせについてorを計算したのを追加
#     break if 追加がもうない
#   end
#   break if 3つのnotが出現してる
#   現状の集合すべての組み合わせについてnotを計算したのを追加
# end

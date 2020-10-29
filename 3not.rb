
def check(d)
  found2 = true
  while found2 do
    found2 = false
    found = true
    while found do
      found = false
      d_save = d.dup
      d_save.keys.combination(2){ |a|
        v = a[0] & a[1]
        unless d[v]
          d[v] = "(#{d[a[0]]} & #{d[a[1]]})"
          found = true
          found2 = true
        end
      }
    end
    
    found = true
    while found do
      found = false
      d_save = d.dup
      d_save.keys.combination(2){ |a|
        v = a[0] | a[1]
        unless d[v]
          d[v] = "(#{d[a[0]]} | #{d[a[1]]})"
          found = true
          found2 = true
        end
      }
    end
  end

  d
end

d1 = {}
d1[0b01010101] = '0b01010101'
d1[0b00110011] = '0b00110011'
d1[0b00001111] = '0b00001111'

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
EOF
      puts "puts '10101010'"
      puts "puts sprintf('%08b',#{d3[0b10101010]})"
      puts "puts '11001100'"
      puts "puts sprintf('%08b',#{d3[0b11001100]})"
      puts "puts '11110000'"
      puts "puts sprintf('%08b',#{d3[0b11110000]})"
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
#   count += 1
# end
# puts count

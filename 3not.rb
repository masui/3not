

d = {}
d[0b01010101] = '01010101'
d[0b00110011] = '00110011'
d[0b00001111] = '00001111'


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

d.keys.each { |v|
  d2 = d.dup
  d2[v ^ 0b11111111] = "(^ #{d[v]})"
  d2 = check(d2)
  d2.keys.each { |v|
    d3 = d2.dup
    d3[v ^ 0b11111111] = "(^ #{d2[v]})"
    d3 = check(d3)
    if d3[0b10101010] && d3[0b11001100] && d3[0b11110000]
      puts "FOUND!!!!"
    end
  }
}



# count = 0
# 
# d = [0b01010101, 0b00110011,0b00001111].sort.uniq
# 
# while true do
#   while true do
#     oldd = d.dup
#     oldd.combination(2) { |a|
#       d.push (a[0] & a[1])
#       d = d.sort.uniq
#     }
#     break if d.length == oldd.length
#   end
#   
#   while true do
#     oldd = d.dup
#     oldd.combination(2) { |a|
#       d.push (a[0] | a[1])
#       d = d.sort.uniq
#     }
#     break if d.length == oldd.length
#   end
#   
#   exit if d.member?(0b10101010) && d.member?(0b11001100) && d.member?(0b11110000)
#   
#   d.each { |v|
#     b = sprintf("%08b",v)
#     puts b
#   }
#   exit
# 
#   # not追加
#   d.dup.each { |v|
#     d.push (v ^ 0b11111111)
#   }
#   d = d.sort.uniq
# 
# end

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

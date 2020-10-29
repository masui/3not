count = 0

d = [0b01010101, 0b00110011,0b00001111].sort.uniq

while true do
  while true do
    oldd = d.dup
    oldd.combination(2) { |a|
      d.push (a[0] & a[1])
      d = d.sort.uniq
    }
    break if d.length == oldd.length
  end
  
  while true do
    oldd = d.dup
    oldd.combination(2) { |a|
      d.push (a[0] | a[1])
      d = d.sort.uniq
    }
    break if d.length == oldd.length
  end
  
  exit if d.member?(0b10101010) && d.member?(0b11001100) && d.member?(0b11110000)
  
  d.each { |v|
    b = sprintf("%08b",v)
    puts b
  }
  exit

  # not追加
  d.dup.each { |v|
    d.push (v ^ 0b11111111)
  }
  d = d.sort.uniq

end

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

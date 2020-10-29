# 3not.rbの出力を人力で整形したもの

def inv(v)
  0b11111111 ^ v
end

A = 0b01010101
B = 0b00110011
C = 0b00001111

INV1 = inv((A & B) | (A & C) | (B & C))
printf("%08b\n",INV1)
# INV1 = 11101000
INV2 = inv(((A & B & C) | ((A | B | C) & INV1)))
printf("%08b\n",INV2)
# INV2 = 10010110
puts

puts '10101010'
puts sprintf('%08b',(((B | C) & INV1) | (((B & C) | INV1) & INV2)))
puts sprintf('%08b',B & INV1 | C & INV1 | B & C & INV2 | INV1 & INV2)
puts '11001100'
puts sprintf('%08b',(((A | C) & INV1) | (((A & C) | INV1) & INV2)))
puts '11110000'
puts sprintf('%08b',(((A | B) & INV1) | (((A & B) | INV1) & INV2)))

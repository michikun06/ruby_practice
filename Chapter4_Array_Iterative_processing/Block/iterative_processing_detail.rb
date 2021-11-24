# timesメソッド : 配列を使わずに単純n回繰り返したいとき
sum = 0
5.times { sum += 1 }
p sum      #=> 5


# uptoメソッド・downtoメソッド : nからmまで1ずつ増やしながら何かを処理したい場合はupto、減らしたい場合はdowntoメソッドを用いる
upto_box = []
10.upto(14) { |n| upto_box << n }
p upto_box     #=> [10, 11, 12, 13, 14]

downto_box = []
20.downto(10) { |n| downto_box << n }
p downto_box     #=> [20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10]


# stepメソッド : 1,3,5,7のようにnからmまでx個ずつ値を増やしながら何かを処理したい場合
step_box = []
1.step(10, 2) { |n| step_box << n }
p step_box     #=> [1, 3, 5, 7, 9]
# ※逆に減らしていく処理を行いたい場合はstepの第二引数をマイナスの値にする


# while文とuntil文 : 繰り返し用の構文。条件式が真である間に処理を行うのがwhile、偽である間に処理を行うのがuntil文
while_box = []
while while_box.size < 5
    while_box << 1
end
p while_box     #=> [1, 1, 1, 1, 1]

while_box << 2 while while_box.size < 10
p while_box     #=> [1, 1, 1, 1, 1, 2, 2, 2, 2, 2]

until_box = [1, 2, 3, 4, 5]
until until_box.size <= 3
    until_box.delete_at(-1)
end
p until_box     #=> [1, 2, 3]

# ※上記二つの構文は無限ループの条件式を書かないように注意


# for文 : eachメソッドとほぼ同じ。rubyでは通常for文よりもeachメソッドを使用する
for_box = [6, 7, 8, 9, 10]
for number in for_box
    sum += number
end
p sum     #=> 45


# loopメソッド : 無限ループを行うために用意されたメソッド{}内(もしくはdo...end内)の処理を行う
loop {
    random_number = for_box.sample
    p random_number
    break if random_number == 10
}
#  ループ文は原則loopメソッドを使用する（for文では書かない（rubocopより））

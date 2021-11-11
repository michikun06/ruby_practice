# [前提]rubyでは繰り返し処理を原則使用しない。構文で繰り返す処理を作りのではなく、配列自体に処理を施すことで繰り返しを行う。
# 下記コードのdo ~ end がブロックになる。 numberはブロック引数と呼ばれる。
numbers = [1, 2, 3, 4]
sum = 0

numbers.each do |number|
  sum += number
end
puts sum

numbers.delete_if do |number|
  number.even?     # numberが偶数ならば「真」
end
p numbers

# {}でdo...endを省略させることも可能 
numbers.each { |number| sum += number }
puts sum

# 改行を含むような長いブロックを書くときはdo...end
# １行でコンパクトに描きたいときは{}


# ブロックで配列を使う時のメソッド（使用頻度が高いもの。/はエイリアスメソッドを表し、<==>は対のメソッドを表す）

randoms = [13, 31, 5, 66, 83]

# map/collect : ブロックの戻り値が配列の要素となる新たな配列を作成する
ten_times_randoms = randoms.map { |random| random * 10 }
p ten_times_randoms

# select/find_all <==> reject  : 各要素に対してブロックを評価して、「真」になるものだけを戻り値として返すメソッド
over_300 = ten_times_randoms.select { |ten_times_random| ten_times_random >= 300 }
p over_300

under_100 = ten_times_randoms.reject { |ten_times_random| ten_times_random > 100 }
p under_100

# find/detect : ブロックの戻り値が真になった最初の要素を返す。
even_number = randoms.find { |random| random.even? }
p even_number

# inject/reduce : たたみ込み演算を行うメソッド（resultの初期値は引数０が入り、randomにはrandoms配列の値が一つずつ入る）
sum_randoms = randoms.inject(0) { |result, random| result + random }
p sum_randoms


# シンボルを使って簡潔に書く
puts ["ruby", "java", "perl"].map { |language| language.upcase }
puts ["ruby", "java", "perl"].map(&:upcase)

puts [1, 2, 3, 4, 5, 6].select { |number| number.odd? }
puts [1, 2, 3, 4, 5, 6].select(&:odd?)
# ※rubocopでも上の書き方はbadで下の書き方がgoodとなっている。以下の条件が揃ったときはこのように書く。
## ①ブロック引数が一つだけ
## ②ブロックで呼び出すメソッドには引数がない
## ③ブロックの中では、ブロック引数に対してメソッドを一回呼び出す以外の処理がない
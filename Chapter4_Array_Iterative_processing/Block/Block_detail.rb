# 添字つきの繰り返し処理（each文ではできないこと）
fruits = %w(apple orange melon)
fruits.each_with_index { |fruit, i| puts "#{i+1}番目 : #{fruit}" }


# mapのように返り値として添字も取得する（with_index）
# mapだけでなく様々なメソッドとも組み合わせ可能
p fruits.map.with_index { |fruit, i| "#{i+1}番目 : #{fruit}" }
p fruits.delete_if.with_index { |fruit, i| fruit.include?("a") && i.odd? }     ## 添字が偶数且つ文字列にaを含むものを削除する


# 添字を0以外から開始させる方法
members = %w(kawaji murakami tanaka)
p members.map.with_index(10) { |member, i| "#{i} : #{member}" }


# 配列がブロックの引数に渡される場合
dimensions = [
    # [縦, 横],
    [10, 20],
    [30, 40],
    [50, 60],
]
areas = []
# 配列の数だけブロック引数を与えると配列の中身を取得することができる。
dimensions.each do | length, width | 
    areas << length * width
end
p areas


# ブロック引数の数と要素の数に相違がある場合は値が捨てられる or nilになる
dimensions.each do |length, width, foo, bar|
    p [length, width, foo, bar]
end


# ブロック引数として複数の要素も取得しながら、配列番号も取得する方法
dimensions.each_with_index do |(length, width), i|
    puts "length: #{length}, width: #{width}, i: #{i}"
end


# ブロックローカル変数
numbers = [1, 2, 3, 4]
sum = 0
## ブロック引数を呼ぶ際に「;」の後に宣言した引数はブロック内でのみ有効なローカル変数となる
numbers.each do |n; sum|
    sum = 10
    sum += n
    p sum
end


# テキストファイルに文字を書き込むブロック（繰り返し文）
File.open("./sample.txt", "w") do |file|
    file.puts("１行目のテキストです。")
    file.puts("２行目のテキストです。")
    file.puts("３行目のテキストです。")
end
# 追加した中身を表示
data = File.open("sample.txt")
puts data.read


# ブロックを作成する際の「do...end」と「{}」の結合度の違いについて
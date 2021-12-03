puts "----------Hashクラスで使用頻度の高い引数について----------"
# ハッシュクラスで使用頻度の高いメソッドについて
currencies = { japan: "yen", us: "dollar", india: "rupee" }

# keys : ハッシュのキーを配列として返す
p currencies.keys

# values : ハッシュの値を配列として返す
p currencies.values

# has_key?(key?,include?,member?) : ハッシュの中に指定されたキーが存在するかを判定する(true or false)メソッド。()内はエイリアスメソッド。
p currencies.has_key?(:japan)


puts "----------「**」によりハッシュを展開----------"
# 「**」でハッシュを展開させる(merge()メソッドでも可能)
currencies_2 = { italy: "rupee", **currencies }
p currencies_2

puts "----------擬似キーワード引数----------"
# ハッシュを使った擬似キーワード引数
## ハッシュを引数として受け取り、擬似キーワード引数を実現する
def buy_burder(menu, options = {})
    puts "#{menu}バーガーを購入しました。"
    if options[:drink]
        puts "ドリンクを購入しました。"
    end
    if options[:potato]
        puts "ポテトを購入しました。"
    end
end

buy_burder("チーズ", drink: true, potato: true)


puts "-----------------------------------"
# キーワード引数に「**」をつけると任意のハッシュとして格納される。
def buy_burder_other(menu, drink: true, potato: true, **others)
    puts others
end
buy_burder_other("fish", salad: true, chicken: true)


puts "-----------------------------------"
# Rubyでは最後の引数にハッシュを用いていればハッシュリテラル{}を省略できるというルールがある。
buy_burder("fish", drink: true, potato: true)
# buy_burder(drink: true, potato: true, "fish")     # 引数の最後がハッシュでないのにハッシュリテラルを省略しているため、エラーが発生する


puts "-----------------------------------"
# 配列からハッシュへ、ハッシュから配列へ
array = currencies.to_a
p array     #=>[[:japan, "yen"], [:us, "dollar"], [:india, "rupee"]]
p array.to_h     #=>{:japan=>"yen", :us=>"dollar", :india=>"rupee"}
puts "-----------------------------------"
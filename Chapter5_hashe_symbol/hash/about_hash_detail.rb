# ハッシュのキーにはシンボルを使うことができる（文字列よりもシンボルの方が適している）
currencies = { :japan => "yen", :us => "dollar", :india => "rupee" }
puts currencies[:us]     #=>dollar

currencies[:italy] = "euro"     # キーにハッシュを指定して値を追加


# 異なるデータ型が混在するケース
person = {
    name: "Alice",     # 値が文字列
    age: 20,     # 値が数値
    friends: ["Bob", "Carol"],     # 値が配列
    phones: { home: "0994-12-3456", mobile: "080-1234-5678" }     # 値がハッシュ
}

puts "#{person[:name]}さん"     #=>Aliceさん
puts "#{person[:age]}歳"     #=>20歳
puts person[:phones][:mobile]     #=>080-1234-5678


puts "--------------------"
# メソッドのキーワード引数（メソッドを呼び出す際に説明を追加する）
def buy_burger(menu, drink: false, potato: false)
    puts "#{menu}バーガーを購入しました。"
    if drink
        puts "ドリンクを購入しました"
    end
    if potato
        puts "ポテトを購入しました"
    end
end
buy_burger("チーズ")
buy_burger("チーズ", drink: true, potato: true)  


puts "--------------------"











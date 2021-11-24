# ハッシュ : キーと値の組み合わせでデータを管理するオブジェクトのこと（他言語では連想配列と言ったりもする）

# ハッシュ例(改行して書くことも可能)
currencies = {"japan" => "円", "us" => "dollar", "india" => "rupee"}
# {
#     "japan" => "yen",
#     "us" => "dollar",
#     "india" => "rupee"
# }


# 要素の追加、変更、取得
currencies["italy"] = "euro"     # 要素の追加

currencies["japan"] = "yen"     # 要素の変更

p currencies["italy"]     #=> "euro"  要素の取得

p currencies     #=> {"japan"=>"yen", "us"=>"dollar", "india"=>"rupee", "italy"=>"euro"}


puts "----------------------------"
# ハッシュを使った繰り返し処理
currencies.each do |key_value|
    key = key_value[0]
    value = key_value[1]
    puts "#{key} : #{value}"
end


# ハッシュ同士で比較すると、「キー」と「値」が全て同じであればtrueになる（並び順は関係ない）


p currencies.size     #=>4 ハッシュの要素数（キーの数）を取得
currencies.delete("japan")     # キーがjapanの要素を削除
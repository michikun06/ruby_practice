# CSVやJSONといった特定の形式のファイルを読み書きするライブラリがある。

# 
# ・CSVクラス
# 
require 'csv'
CSV.open('./sample.csv', 'w') do |csv|
    csv << ['Name', 'Email', 'Age']
    csv << ['Alice', 'alice@ezample.com', 20]
end

CSV.foreach('./sample.csv', col_sep: ",") do |row|
    # 各行について、１行目から３行目までの値をターミナルに表示する
    puts "1: #{row[0]}, 2: #{row[1]}, 3: #{row[2]}"
end

#=>1: Name, 2: Email, 3: Age
#=>1: Alice, 2: alice@ezample.com, 3: 20



# 
# ・JSONモジュール
# JavaScript Object Notationの略でJavaScriptと互換性のあるテキストフォーマットの一種
# シンプルかつ軽量にオブジェクトの内容を表現できる
require 'json'
user = { name: 'Alice', email: 'alice@example.com', age: 20 }

# ハッシュ(user)をJSON形式の文字列に変換する。
user_json = user.to_json
puts user_json     #=>{"name":"Alice","email":"alice@example.com","age":20}

# JSON形式の文字列をパースしてハッシュに変換する（キーは「シンボル」から「文字列」になる）
puts JSON.parse(user_json)     #=>{"name"=>"Alice", "email"=>"alice@example.com", "age"=>20}



# 
# ・YAMLモジュール
# 
# インデントを使ってデータの階層構造を表現するテキストフォーマットの一種
require 'yaml'
yaml = <<TEXT
alice:
    name: 'alice'
    email: 'alice@example.com'
    age: 20
TEXT

# YAMLテキストをパースしてハッシュに変換する
puts users = YAML.load(yaml)     #=>{"alice"=>{"name"=>"alice", "email"=>"alice@example.com", "age"=>20}}

# テキストに新しい要素と値を追加する
users['alice']['gender'] = :female
puts users     #=>{"alice"=>{"name"=>"alice", "email"=>"alice@example.com", "age"=>20, "gender"=>:female}}

# テキストからYAMLテキストに変換する
puts YAML.dump(users)
#=>---
#=>alice:
#=>  name: alice
#=>  email: alice@example.com
#=>  age: 20
#=>  gender: :female
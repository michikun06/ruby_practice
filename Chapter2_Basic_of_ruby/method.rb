# メソッドの定義
## 二つの数字を加算するメソッドを作成
def add(a, b)
    a + b
end
print add(3, 5)
puts add(1, 2)
p add(2, 6)

# rubyのメソッド名の付け方
## ・スネークケース（すべて小文字でに単語以上ある場合は_で区切る）
## ・数字を入れるのはOKだが先頭に入れたらNG
## ・基本アルファベットで記述

# メソッドの戻り値について
## Rubyは最後に評価された式が戻り値になる。returnは不要で使わないのが一般的(returnは脱出するときに使われる)

# ()の使い方について
## rubyではメソッド名の後の()は省略できる。引数がある場合には()を使用して、ない場合には（）を使用しないのが一般的

# デフォルト付きの引数
## rubyではメソッドを呼び出す際に引数の過不足があるとエラーになるためデフォルトで引数を与えることができる
def foo(time = Time.now, message = "bar")
    puts "time : #{time}, message : #{message}"
end
foo

# ?で終わるメソッド
## Rubyでは?で終了するメソッドでは慣習として真偽値を返すメソッド（trueかfalseを返す）となる。
## 真偽値を返すメソッドであれば?で終わらせるようにする。
def multiple_of_three?(n = 3)
    n % 3 == 0
end
puts multiple_of_three?
puts multiple_of_three?(4)

# !で終わるメソッド
## Rubyでは!で終了するメソッドでは慣習として「使用する際は注意が必要」という意味を持つ
## 例えば下記メソッド。Stringオブジェクトには「upcase」と「upcase!」の２種類がある。
## どちらも大文字にするという意味を持っているが、「upcase!」メソッドは呼び出した文字列自身も変更するという意味を持つ。
## 呼び出し元の変数も変更させるメソッドを「破壊的メソッド」という。メソッドに「!」がついていた場合はAPIドキュメントを読んで確認する。
s = "ruby"
def reverse_upcase!(name)
    name.reverse!.upcase!
end
puts s     ## 変数宣言通りrubyが格納されている
puts reverse_upcase!(s)     ## メソッドによりreverseしてupcaseしている
puts s     ## 破壊的メソッドにより、reverseしてupcaseした状態になっている
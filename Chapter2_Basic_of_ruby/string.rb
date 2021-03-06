# リファレンスマニュアル
# https://docs.ruby-lang.org/ja/latest/class/String.html

# stringクラス
#  文字列のクラスです。ヌル文字を含む任意のバイト列を扱うことができます。文字列の長さにはメモリ容量以外の制限はありません。

# 破壊的な変更  :  あるオブジェクトの内容自体を変化させることです。
a = "string"
b = a
a.upcase!
puts a   # => STRING
p b   # => "STRING"
# これは変数aとbが一つの文字列オブジェクトを指していたが、upcase!メソッドでオブジェクト自体を変更された


# 文字列のエンコーディングと多言語化
puts "いろは".size      #=> 3
puts "漢字"[0]          #=> "漢"
puts "山本山".reverse   #=> "山本山" (回文なので分からないですね)
puts "ループ".reverse   #=> "プール"

s = "ruビー"
s[0..1] = "ル"
puts s                  #=> "ルビー"

e = "言語".encode("EUC-JP")
u = "言語".encode("UTF-8")
puts e.encoding                   #=> Encoding::EUC_JP
puts u.encoding                   #=> Encoding::UTF_8


# 例:文字列の結合
s = "いろは"
a = s.encode("EUC-JP")
b = s.encode("UTF-8")
puts a == b                            #=> false

s = "合".encode("EUC-JP")
puts s + "\u{4f53}".encode("EUC-JP")   #=> "合体"
puts s + "\u{4f53}"                    #=> Encoding::CompatibilityError

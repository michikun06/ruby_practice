# Rubyの真偽値
## ・falseまたはnillであれば偽
## ・それ以外はすべて真

# 論理演算子
## $$(論理積)、||(論理和)のことRubyは論理積が優先される。（）を用いることで変更可能

# if文
## elsifは「e」がないので注意が必要。
country = "italy"
if country == "italy"
    puts "ciao"
elsif country == "japan"
    puts "こんにちは"
elsif country == "us"
    puts "hello"
else
    puts "???"
end
 #=> ciao

#  他にもifと逆のunless文やcase/when文などがある。

# &&や||の戻り値と評価を終了するタイミング
## 基本的に左から式評価していくため、最後の値がfalse or true or nilで判断されるがfalseとnilに関しては出た時点で偽となる
puts 1 && 2 && 3
puts 1 && nil && 4
puts 1 && nil || false

# 優先順位
# 高い   ::
#        []
#        +(単項)  !  ~
#        **
#        -(単項)
#        *  /  %
#        +  -
#        << >>
#        &
#        |  ^
#        > >=  < <=
#        <=> ==  === !=  =~  !~
#        &&
#        ||
#        ..  ...
#        ?:(条件演算子)
#        =(+=, -= ... )
#        not
# 低い   and or

## 「and」と「&&」」、「or」「||」はいずれも意味は同じであるが優先順位が異なるため、注意が必要（どこの式が先に評価されるかに注意）

# unless文
## 条件式がifと反対になる（偽になった場合に処理を行う）
## if文とunless文では少し書く分量が違うが基本的にはif文の否定条件のままでも良い
## unless文はelseは使えるがif文でいうelsifのようなものはない
status = "error"
if status != "ok"
    puts "異常が起こっています。"
end
unless status == "ok"
    puts "異常が起こっています。"
end

# case文
## if文で複数の条件を用いるときはcase文を採用する。
country = "アメリカ"
greeting = 
    case country
    when "japan"
        "こんにちは"
    when "italy"
        "ciao"
    when "us","アメリカ"     ## このようにwhen節に条件を複数指定することも可能
        "hello"
    else
        "???"
    end
puts greeting

# 条件演算子（三項演算子）
## 「？」を用いた条件分岐を使うことができる。（？より前が真なら左側、偽なら右側の処理を行う。）
## シンプルな条件式には条件演算子が効果的。しかし、複雑な条件式はかえって読みづらくなるので常に可読性を意識
price = 8000
puts price > 5000 ? "送料無料" : "配送料がかかります"
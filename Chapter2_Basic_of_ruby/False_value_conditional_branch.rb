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
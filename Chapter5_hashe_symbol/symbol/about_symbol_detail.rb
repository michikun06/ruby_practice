# 様々なシンボルクラスの作成方法
:apple
:Apple
:ruby_is_fun
:okay?
:welcome!
:_secret
:$dollar
:@at_mark
# 以下の場合は''で囲む必要がある
:'12345'     # 冒頭に数字を持ってくる場合
:'ruby-is-fun'     #「-」を用いる場合
:'ruby is fun'     # 空白を用いる場合
:'()'     # ()を用いる場合


# %記法を用いてsymbolを作成する場合は%sを使用する
p %s!ruby is fun!     #=>:"ruby is fun"

# $Iを用いると、シンボル内に式展開を行うことができる。
name = "alice"
p %I(name #{name.upcase})


# symbolクラスとstringクラスは見た目は似ているが互換性はがないため、全くの別物なので注意
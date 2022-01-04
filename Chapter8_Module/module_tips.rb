# メソッドは同じ名前であれば、継承関係、ミックスインなど様々なパターンが入り混じって構成される。

# 例  :  to_sメソッド
# ・クラス自身にto_sメソッドが定義されている場合
# ・スーパークラスにto_sメソッドが定義されている場合
# ・ミックスインとしてto_sメソッドが定義されている場合

module A
    def to_s
        "<A> #{super}"
    end
end

module B
    def to_s
        "<B> #{super}"
    end
end

class Product
    def to_s
        "<Product> #{super}"
    end
end

class DVD < Product
    include A
    include B

    def to_s
        "<DVD> #{super}"
    end
end

dvd = DVD.new
p dvd.to_s     #=>"<DVD> <B> <A> <Product> #<DVD:0x00007fd5fa83d4c0>"

# メソッドの順番を確認する方法
p DVD.ancestors     #=>[DVD, B, A, Product, Object, Kernel, BasicObject]


# モジュールにモジュールをmix-inする
module Greeting
    def hello
        'hello.'
    end
end

module Aisatsu
    include Greeting
    def konnichiwa
        'こんにちは。'
    end
end

class User
    include Aisatsu
end

user = User.new

p user.konnichiwa     #=>"こんにちは。"
p user.hello     #=>"hello."   Userクラスから作成したインスタンスが直接ミックスインしていないhelloメソッドを使えることがわかる。

p User.ancestors     #=>[User, Aisatsu, Greeting, Object, Kernel, BasicObject]


# prependでミックスイン
# includeの代わりにprependでもミックスインすることができる。（クラス自身よりも先に最後にミックスインしたモジュールが検索される）
# prependの使い方はincludeと同じ。
User.prepend(A)
p User.ancestors     #=>[A, User, Aisatsu, Greeting, Object, Kernel, BasicObject]   module Aが先に検索されている。


# prependで既存メソッドを置き換える
# 例１
class Product2
    def name
        "A great film"
    end
end

module NameDecorator
    def name
        "<<#{super}>>"
    end
end

class Product2
    prepend NameDecorator
end

product2 = Product2.new
p product2.name     #=>"<<A great film>>"   NameDecoratorモジュールがミックスインされている。

# 例2  :  同一モジュールを他のクラスにミックスインして上書き
class User2
    def name
        "Michihiro"
    end
end

# 以下ミックスインする方法3種
User2.prepend(NameDecorator)
# User2.prepend NameDecorator
# class User2
#     prepend NameDecorator
# end

user2 = User2.new
p user2.name     #=>"<<Michihiro>>"  上書き成功


# 独自の変更の有効範囲を指定できるrefinements

# 文字列をシャッフルするメソッドを有したモジュールの定義
module StringShuffle
    refine String do
        def shuffle
            chars.shuffle.join
        end
    end
end

class User3
    using StringShuffle     # このクラスでStringShuffleモジュールのメソッドを使えるように有効化
    
    def initialize(name)
        @name = name
    end

    def shuffled_name
        @name.shuffle     # User3クラスであればStringShuffleモジュールのshuffleメソッドが利用できる
    end
end

user3 = User3.new('Alice')
p user3.shuffled_name     #=>"elAci"
# p 'Alice'.shuffled_name     #=>undefined method `shuffled_name' for "Alice":String (NoMethodError)
# 'Alice'オブジェクトにはshuffled_nameメソッドはないのでエラーになる。


# 「::」と「.」の違い
# 「::」  基本的に名前空間を区切ったり、定数を参照するときに使用する。（メソッド呼び出しもできるが基本的に使わない。）
# 「.」   メソッドを呼び出すときに使用する。(定数参照などはできない。基本的に「.」の右側はメソッドが期待されているから)
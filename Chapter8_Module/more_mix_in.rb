# includeされているか確認する方法
module Loggable
end

class Product
    include Loggable
end

p Product.include?(Loggable)     #=>true
p Product.included_modules     #=>[Loggable, Kernel]


# include先のクラスにあるメソッドをクラス内で使う方法
module Taggable
    def price_tag
        "#{price}円"
    end
end

class Product2
    include Taggable

    def price
        1000
    end
end

product2 = Product2.new
p product2.price_tag     #=> "1000円"


# Enumerableモジュール  :  配列やハッシュ、範囲(Range)などの繰り返し処理ができるクラスにincludeされているモジュールのこと
p Array.include?(Enumerable)     #=>true

# Enumerableモジュールにはいくつかメソッドが定義されている。下記のように呼び出すことができる。(map、select、find、countなど)
# mapメソッドの例
p [1, 2, 3].map { |n| n * 10 }     #=>[10, 20, 30]
hash = { a: 1, b: 2, c: 3 }
p hash.map{ |k, v| [k, v * 10] }     #=>[[:a, 10], [:b, 20], [:c, 30]]
p (1..5).map { |n| n * 10 }     #=>[10, 20, 30, 40, 50]

# countメソッドの例
p [1, 2, 3].count     #=>3
p hash.count     #=>3
p (1..5).count     #=>5


# Comparableモジュール  :  二つのオブジェクトの大小関係を識別可能にするモジュールのこと。
# 左辺が右辺よりも大きければ正の整数
# 同値ならば0
# 比較できなければnil
p 2 <=> 1     #=>1
p 2 <=> 2     #=>1
p 2 <=> 3     #=>-1
p 2 <=> 'abc'     #=>nil

# 音楽の曲の速さを表すクラスを作り、Comparableモジュールをincludeする。
class Tempo
    include Comparable

    attr_reader :bpm

    def initialize(bpm)
        @bpm = bpm
    end
    
    # <=>はComparableモジュールで使われる演算子（メソッド）
    def <=>(other)
        if other.is_a?(Tempo)
            bpm <=> other.bpm
        else
            nil
        end
    end

    # 結果を見やすくするためにメソッドを作成
    def inspect
        "#{bpm}bpm"
    end
end

p t_120 = Tempo.new(120)     #=>120bpm
p t_180 = Tempo.new(180)     #=>180bpm

p t_120 > t_180     #=>false
p t_120 <= t_180     #=>true
p t_120 == t_180     #=>false


# Kernelモジュール  :  p、puts、loopなどのメソッドはが定義されているモジュール。
# 事実上、最上位にいるObjectクラスがKernelモジュールをincludeしているため、RubyではどこでもKernelモジュールのメソッドを使用することができる。


# Rubyの起動直後、selfはObjectクラスにいる
# クラス内部ではselfはそにクラスになる
p self     #=>main
p self.class     #=>Object
class User
    p self     #=>User
    p self.class     #=>Class
end


# モジュールとインスタンス変数について
# モジュール内で定義したメソッド内でインスタンス変数を読み書きすると、インクルード先の区たすのインスタンス変数を読み書きしたことと、同じになる
module NameChanger
    def change_name
        @name = 'ありす'
    end
end

class User2
    include NameChanger

    attr_reader :name

    def initialize(name)
        @name = name
    end
end

user2 = User2.new('alice')
p user2.name     #=>"alice"
user2.change_name     #=>モジュール内のメソッドにてインスタンス変数を書き換え
p user2.name     #=>"ありす"


# オブジェクトに直接ミックスインすることも可能

module Loggable3
    def log(text)
        puts "[LOG]#{text}"
    end
end

string = 'abc'

# 通常stringはStringクラスに属しており、logメソッドを持ち合わせていないためエラーとなる
# string.log     #=>more_mix_in.rb:138:in `<main>': undefined method `log' for "abc":String (NoMethodError)

string.extend(Loggable3)

string.log('Hello')     #=>[LOG]Hello   stringオブジェクトにLoggable3モジュールをextendしたため、特異メソッドとしてlogメソッドが使えるようになった。
# モジュール単体に特異メソッドを定義する。
# classでクラスメソッドを作成する場合に比べて、タイプ量を減らすことができる
module Loggable
    def self.log(text)
        puts "[LOG]#{text}"
    end
end

Loggable.log('Hello')     #=>[LOG]Hello


# module_functionメソッド  :  ミックスインとしても使えて、モジュールの特異メソッドとしても使えるメソッド
module Loggable2
    def log(text)
        puts "[LOG]#{text}"
    end

    # メソッドをmodule_functionに設定することでどちらでも使えるようにできる。
    module_function :log
end

Loggable2.log('Hello')     #=>[LOG]Hello

class Product
    include Loggable2
    

    def title
        log('title is called')
        'A great movie'
    end
end

product = Product.new
p product.title
#=>[LOG]title is called   Loggable2モジュールのlogメソッドで出力された
#=>"A great movie"   titleメソッドの返り値として出力された

# ミックスインとしてもモジュールの特異メソッドとしても使えるメソッド(上の場合であればlogメソッド)をモジュール関数という
# module_functionでモジュール関数に設定したメソッドはクラスにミックスインすると、自動的にprivateメソッドとなる。
# p product.log('title is called')     #=>: private method `log' called for #<Product:0x00007fed610312d0> (NoMethodError)


# モジュール内で定数を定義する方法(クラスと同じ)
module Loggable3
    # 定数の定義
    PREFIX = '[LOG]'.freeze
    
    def log(text)
        puts "#{PREFIX} #{text}"
    end
    module_function :log
end

p Loggable3::PREFIX     #=>"[LOG]"
p Loggable3.log('Hello')
# [LOG] Hello
# nil
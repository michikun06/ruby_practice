# includeを使い、moduleをクラスにミックスインしてmoduleにあるメソッドをクラスでも使えるようにすることをミックスインという。
# ミックスインしたメソッドは「public」になるので、基本的には「private」にする。

module Loggable
    private     # publicにする必要がなければ基本private

    def log(text)
        puts "[LOG] #{text}"
    end
end

class Product
    include Loggable     # moduleをミックスイン

    def title
        log('title is called.')
        'A great movie.'
    end
end

class User
    include Loggable     # moduleをミックスイン

    def name
        log 'name is called.'
        'Alice.'
    end
end

product = Product.new
p product.title
# [LOG] title is called.
# "A great movie."

user = User.new
p user.name
# [LOG] name is called.
# "Alice."


# extend
# includeと使い方は同じだが、モジュール内のメソッドをそのクラスの特異メソッド(クラスメソッド)にする
module LoggableSecond
    private     # publicにする必要がなければ基本private

    def log(text)
        puts "[LOG] #{text}"
    end
end

class ProductSecond
    extend Loggable     # moduleをミックスイン

    def self.create_products
        log('create_products is called.')
    end
end

ProductSecond.create_products     #=> [LOG] create_products is called.
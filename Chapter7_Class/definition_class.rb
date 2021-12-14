# classの定義について学習していく

# オブジェクトの作成とinitializeメソッド
# classからnewメソッドを使用してオブジェクトを作成するとinitializeメソッドも同時に呼び出される(プライベートメソッド)
class User1
    def initialize
        puts "initializeメソッドが呼ばれました。"
    end

    def other
        puts "他のメソッドです"
    end
end
User1.new     #=>initializeメソッドが呼ばれました。


# インスタンスメソッド : クラス構文内部で作成したメソッドのこと。「インスタンス」という名前の通り、クラスのインスタンスにのみ使用することができる。
class User2
    def hello
        puts "Hello!!!"
    end
end
user2 = User2.new
user2.hello     #=>Hello!!!


# インスタンス変数とアクセサメソッド

## インスタンス変数 : クラス内で使用する変数のこと。以下の決まりがある。
# ・外部から直接参照することはできないため、参照用のメソッドを作成する必要がある。（変更の場合も同様にする）
# ・作成されていないインスタンス変数を使用すると「nil」が帰ってくる。

## アクセサメソッド : インスタンス変数を読み書きするためのメソッドのこと(他言語ではゲッターメソッド、セッターメソッドともいう)
# ・今回はインスタンス変数変更用のメソッドを作成したが、専用のアクセサメソッドが存在する。
    # attr_accessor : 書き込み読み取り
    # attr_reader : 読み取り
    # attr_writer : 書き込み


class User3
    # インスタンス変数の作成
    def initialize(name)
        @name = name
    end

    # インスタンス変数呼び出し用のメソッド
    def name
        @name
    end

    # インスタンス変数変更用のメソッド
    def name=(value)
        @name = value
    end
end

user3 = User3.new('Alice')
puts user3.name     #=>Alice
user3.name = 'Bob'
puts user3.name     #=>Bob


# クラスメソッド : そのクラスとの関係は深いものの、インスタンスに含まれるデータを使用しないメソッド

# 例①
class User4
    def initialize(name)
        @name = name
    end

    def self.create_users(names)
        names.map do |name|
            User4.new(name)
        end
    end

    def hello
        "Hello, I am #{@name}"
    end
end

names = ["Alice", "Bob", "Carol"]
users = User4.create_users(names)     # インスタンス内のデータを使わずにクラス内のメソッドを使用している（クラスメソッド）
users.each do |user|
    puts user.hello
end

#=> Hello, I am Alice
#=> Hello, I am Bob
#=> Hello, I am Carol


# クラスの中でデフォルトの定数を設定する
class Product
    DEFAULT_PRICE = 0     # デフォルト値の定数めいは全て大文字で設定

    attr_reader :name, :price     # 外部から読み取れるようにアクセサメソッドを設定

    def initialize(name, price = DEFAULT_PRICE)     # 設定したデフォルト値をインスタンス変数に登録
        @name = name
        @price = price
    end
end

product = Product.new('A free movie')
p product.price
# 特異メソッド
# オブジェクト単位でメソッドの作成が可能
member_1 = 'Alice'
member_2 = 'Bob'

# 下記が特異メソッド
def member_1.shuffle      # memberオブジェクトにのみ使用可能な、文字列をシャッフルする「.shuffle」メソッドを作成
    chars.shuffle.join
end

p member_1.shuffle


# クラスメソッドは特異メソッドの一種。レシーバが固有のオブジェクトになったメソッド
# クラスメソッドのレシーバも何かしらのClassの一つである。

# クラスメソッド作成例
class User
    def self.hello
        'Hello!'
    end
end

# 特異メソッドの例
alice = 'I am Alice.'

def alice.hello
    'Hello!'
end


# ダッグタイピング
# Rubyは動的型付け言語。動的型付け言語ではコードを実行する瞬間にそのメソッドが呼び出せるか否かを判断している。
# 引数として渡されたオブジェクトが何のクラスであろうとも、そのクラスのオブジェクトが呼び出せれば良しとするプログラミングスタイルのことを「ダッグタイピング」という。
def display_name(object)
    p "Name is <<#{object.name}>>"
end

class User2
    def name
        'Alice'
    end
end

class Product
    def name
        'A great movie.'
    end
end

user2 = User2.new
display_name(user2)     #=>"Name is <<Alice>>"

product = Product.new
display_name(product)     #=>"Name is <<A great movie.>>"

# ダッグタイピング : 引数がどんなデータであろうともそのメソッドを有していればOKなスタイル

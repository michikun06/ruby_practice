# selfキーワードでエラーが発生するケース
class User
    attr_accessor :name

    def initialize(name)
        @name = name
    end

    # self無しでname=メソッドを呼ぶ
    def rename_to_bob
        name = 'Bob'
    end

    # self付きでname=メソッドを呼ぶ
    def rename_to_carol
        self.name = 'Carol'
    end

    # 直接インスタンス変数を書き換える
    def rename_to_dave
        @name = 'Dave'
    end
end
user = User.new('Alice')     # 変数Aliceでインスタンス作成

user.rename_to_bob
p user.name     #=>"Alice" リネームできていない

user.rename_to_carol
p user.name     #=>"Carol" リネームできた

user.rename_to_dave
p user.name     #=>"Dave" リネームできた

# 【解説】
# この場合、「nameというローカル変数に'Bob'を代入した」と解釈されているため、インスタンス変数@nameにBobは代入されていない。
# セッターメソッド(attr_accessorに設定したもの)を呼び出したい場合は必ずselfをつける必要がある。


# インスタンスメソッド内部でクラスメソッドを呼び出す
class Product
    attr_reader :name, :price

    def initialize(name, price)
        @name = name
        @price = price
    end

    def self.format_price(price)
        "#{price}円"
    end

    def to_s
        formatted_price = Product.format_price(@price)
        "neme: #{@name}, price: #{formatted_price}"
    end
end

product = Product.new('movie', 1000)
p product.to_s
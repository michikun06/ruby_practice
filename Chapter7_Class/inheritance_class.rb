# 継承を使用する場合は「性質」や「概念の共通点」に着目する
#「サブクラスはスーパークラスの一種である」と考える。（is_aの関係）
# サブクラスはスーパークラスの性質をより特化させたもので

# 「商品」というよりも「DVD」と説明する方がより具体的になるイメージ（概念の話）

# Rubyの継承関係は「単一継承」である。つまり、継承できるスーパークラスは一つだけということ。

# 独自で作成されたクラスはデフォルトで「Objectクラス」を継承しているため、to_sメソッドやnil?などObjectクラスのメソッドを使用することができる。
class User
end

user = User.new
p user.to_s     #=>"#<User:0x00007fca2581f078>"
p user.nil?     #=>false

p User.superclass     #=>Object   UserのスーパークラスはObjectクラスであることがわかる。
p user.methods.sort     #=>[:!, :!=, :!~, :<=>,... ,:yield_self]   Objectクラスから継承したインスタンスで使用できるメソッドの一覧を確認することができる。

p user.class     #=>User   userインスタンスはUserのクラスであることが確認できる
p user.is_a?(User)     #=>true   userインスタンスはUserクラスとis_a(継承関係)であることがわかる。


# 独自のクラスを定義する際はObjectクラス以外のクラスを継承することができる。
# Productクラスと、そのクラスを継承したDVDクラスを例にして考える
class Product
    attr_reader :name, :price

    def initialize(name, price)
        @name = name
        @price = price
    end

    def to_s
        "name: #{name}, price:#{price}"
    end
end

product = Product.new('A great movie', 1000)
product.name     #=>'A great movie'
product.price     #=>1000

# DVDクラスにはProductクラスの機能に加えて「再生時間（running_time）」を持たせる。
class DVD < Product   # 「Productを継承したDVDクラス」はこのように書く
    attr_reader :running_time

    def initialize(name, price, running_time)
        # @name = name
        # @price = price
        super(name, price)     # 継承している場合は「super()」と書くことでインスタンス変数の定義を省略することができる。親と子が同じ引数の場合は「super」だけで引き渡し可能
        @running_time = running_time
    end

    def to_s
        "#{super}, running_time:#{running_time}"
    end
end
dvd = DVD.new('A great movie', 1000, 120)
p dvd.name     #=>"A great movie"   継承できていることが確認できる
p dvd.running_time     #=>120   新たに作成した「再生時間」も確認できる

# メソッドのオーバーライド
# → サブクラスでスーパークラスと同じ名前のメソッドを定義すること。スーパークラスの処理に上書きすることができる。
p product.to_s     #=>"name: A great movie, price:1000"   新たに定義したメソッドを呼び出すことができる
p dvd.to_s     #=>"name: A great movie, price:1000, running_time:120"   スーパークラスに加えてサブクラス独自の機能を追加することができる


# クラスメソッドの継承
class Foo
    def self.hello
        'hello'
    end
end

class Bar < Foo
end

p Foo.hello     #=>"hello"
p Bar.hello     #=>"hello"   スーパクラスのクラスメソッドが継承できていることが分かる。
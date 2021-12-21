# メソッドには以下の三つの公開レベルがある。

# publicメソッド
# クラスの外部からも自由に呼び出すことができるメソッドのこと。
# initializeメソッド以外のインスタンスメソッドはデフォルトでpublicメソッドになります。
class PublicUser
    def hello
        'Hello!'
    end
end
user1 = PublicUser.new
p user1.hello     #=>"Hello!"   publicメソッドなのでクラス外部から自由に呼び出すことができる。


# privateメソッド
# クラスの外部からは呼び出せずに、クラスの内部だけで使用できるメソッドのこと。
# 厳密には「レシーバを指定して呼び出すことができないメソッド」になる。user.helloのようにレシーバであるuserを指定してメソッドを呼び出すとエラーになる。
class PrivateUser
    def hello
        "Hello!#{name}"     # レシーバを指定していないのでprivateメソッドを呼び出すことができる。
    end

    # 「private」から下で設定されたメソッドがprivateメソッドになる。
    private
    def name
        'Alice'
    end
end
user2 = PrivateUser.new
# user2.name     # privateメソッドをレシーバを指定して呼び出しているのでエラーになる。
p user2.hello     #=>"Hello!Alice"   helloメソッドはpublicメソッドなので呼び出し可能

# サブクラスでオーバーライドしてもprivateメソッドを利用可能
class PrivateProduct
    def to_s
        "name : #{name}"
    end

    private

    def name
        'A great movie'
    end
end

class DVD < PrivateProduct
    private
    
    def name
        "An Awesome film"
    end
end

private_product = PrivateProduct.new
p private_product.to_s     #=>"name : A great movie"
private_dvd = DVD.new
p private_dvd.to_s     #=>"name : An Awesome film"  オーバーライドされている。

# privateキーワードの下にクラスメソッドを設定してもprivateメソッドにはならないため注意が必要。ベット設定する必要がある。


# protectedメソッド
# privateメソッドと同様「クラス自身から」と「サブクラスのインスタンスからレシーバつきで呼び出すこと」ができる。
# 外部には公開してくないが、同じクラス、サブクラス内においてレシーバつきで呼び出せるようにしたいときに利用する
class ProtectedUser
    # nameのみ外部から読み込み可能
    attr_reader :name

    def initialize(name,weight)
        @name = name
        @weight = weight
    end

    # 自分がother_userよりも体重が重い場合はtrueを返すメソッド
    def heaver_than?(other_user)
        other_user.weight < @weight
    end

    protected

    def weight
        @weight
    end
end
alice = ProtectedUser.new('Alice', 50)
bob = ProtectedUser.new('Bob', 60)

# 同じクラスのインスタンスメソッド内部であればweightが呼び出せる。
p alice.heaver_than?(bob)     #=>false
p bob.heaver_than?(alice)     #=>true
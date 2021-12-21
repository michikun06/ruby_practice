# エイリアスメソッドの定義とメソッドの削除
class User
    def hello 
        'Hello!'
    end
    alias greeting hello     #alias 新しい名前 元の名前

    # undef hello     これでhelloメソッドは削除される
end

user = User.new
p user.hello     #=>"Hello!"
p user.greeting     #=>"Hello!"


# 等値（二つの値が等しいかどうか）を判断するメソッドや演算子について理解する
# .equal? : object_idが等しいときにtrueを返す
a = 'abc'
b = 'abc'
p a.equal?(b)     #=>false  object_idが異なるためfalse


# == : オブジェクトの内容が等しいかどうかを判断する
p 1 == 1.0     #=>true  1と1,0は算数的には同じだから


# .eql? : ハッシュのキーとして二つのオブジェクトが等しいか判断する
#         「==」と異なり、ハッシュのキーで判断している。
c = 'japan'
d = 'japan'
p c.eql?(d)     #=>true  ハッシュ値が同じ

e = 1
f = 1.0
p e.eql?(f)     #=>false  ハッシュ値が異なる


# === : 比較元（左側）のクラス（String、Integerなど）によって異なる挙動を示す。
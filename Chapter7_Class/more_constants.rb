# クラス内部の定数は外部から直接参照することも可能です。
# 外部から参照させたくない場合はprivate_constantで定数を指定する
# メソッドの内部で定数を宣言すると、エラーになる。

class Product
    DEFAULT_PRICE = 0
    DEFAULT_NAME = 'Alice'

    private_constant :DEFAULT_NAME
end
p Product::DEFAULT_PRICE     #=>0
# p Product::DEFAULT_NAME     #=> NameError


# 定数と再代入(基本的に定数に対して際代入はしない)
Product::DEFAULT_PRICE = 1000     # warningが出るが再代入は可能
p Product::DEFAULT_PRICE     #=>1000

Product.freeze
Product::DEFAULT_PRICE = 2000     # FrozenErrorとなり、際代入不可

# 定数はミュータブルなオブジェクト（元データを変更する）ので注意が必要。それを防ぐためにfreezeメソッドがある
# クラスインスタンス変数
# 各オブジェクトごとに影響されないclass独自に持っている変数のこと
# 継承関係でも、親子でも共有されることがない
class Product
    @name = 'Product'

    def self.name
        @name
    end

    def initialize(name)
        @name = name
    end
    
    def name
        @name
    end
end

class DVD < Product
    @name = 'DVD'

    def self.name
        @name
    end

    def upcase_name
        @name.upcase
    end
end

p Product.name     #=>"Product"  クラスインスタンス変数
p DVD.name     #=>"DVD"  クラスインスタンス変数

product = Product.new('A great movie.')
p product.name     #=>"A great movie."　　インスタンス変数

dvd = DVD.new('An awesome film.')
p product.name     #=>"A great movie."  インスタンス変数
p dvd.upcase_name     #=>"AN AWESOME FILM."  インスタンス変数に対してupcaseメソッドが呼ばれた


# クラス変数
# クラスメソッド内、インスタンスメソッド内、スーパークラス、サブクラスでも共有される変数のこと
# ライブラリ（gem）の設定情報(config)などに使用される


# グローバル変数、Ruby標準の組み込み変数（特殊変数）
# グローバル変数 : 「$○○」のように設定する。プログラムのどこからでも参照できるが基本的にかかない
# 特殊変数 : Rubyに最初から標準で搭載されている変数。この変数と同名の変数を使うことはできない。
$program_name = 'Awesome program'     # グローバル変数

class Program
    def initialize(name)
        $program_name = name     # クラス名が呼ばれた段階でグローバル変数を書き換える
    end

    def self.name
        $program_name
    end

    def name
        $program_name
    end
end

program = Program.new('Super program')

p program.name     #=>'Super program'   インスタンスメソッドが呼ばれインスタンス変数が使われる
p Program.name     #=>'Super program'   クラスメソッドが呼ばれ、インスタンス変数が使われる
p $program_name     #=> 'Super program'   initializeメソッドでグローバル変数が変更されていることが分かる
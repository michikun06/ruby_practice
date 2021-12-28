# 空間名前  :  要素（クラス）名が重複しても識別できるように要素の集合に対して付与された名前のこと。モジュールにて設定可能
# 同名のクラスでもどこのモジュールに所属しているかで識別することができる。

module Baseball
    class Second
        def initialize(player, uniform_number)
            @player = player
            @uniform_number = uniform_number
        end
    end
end

module Clock
    class Second
        def initialize(digits)
            @digits = digits
        end
    end
end

Baseball::Second.new('Alice', 13)     # Baseballモジュールに属しているSecondクラス
Clock::Second.new(13)     # Clockモジュールに属しているSecondクラス


# ネストなし(moduleの中に書かずに)で名前空間付きのクラスを定義することも可能
module Baseball2
end

class Baseball2::Second
    def initialize(player, uniform_number)
        @player = player
        @uniform_number = uniform_number
    end
end
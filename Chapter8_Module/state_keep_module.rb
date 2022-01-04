# クラスインスタンス変数はクラス専用の変数を定義した。
# モジュールも専用の変数を定義することができる。

module AwesomeApi
    # 設定値を保存する、AwesomeApi専用の変数
    @base_url = ''
    @debug_mode = false

    # クラスメソッドを作成
    class << self
        def base_url=(value)
            @base_url = value
        end

        def base_url
            @base_url
        end

        def debug_mode=(value)
            @debug_mode = value
        end

        def debug_mode
            @debug_mode
        end

        # 上の四つのメソッドは下記のアクセサメソッド１行で定義することができる。
        # attr_accessor :base_url, :debug_mode
    end
end

#  設定値の保存
AwesomeApi.base_url = 'http://example.com'
AwesomeApi.debug_mode = true

# 設定値の参照
p AwesomeApi.base_url     #=>"http://example.com"
p AwesomeApi.debug_mode     #=>true

# モジュールで作成したがクラスでも同様のことができる(7.9.1)クラスとモジュールの異なる点は「インスタンスを作成できないこと。」
# インスタンスを作成する必要がないのであれば、モジュールで作成する方が他のチームメンバーに勘違いをさせずに済む

# シングルトンパターン  :  設定値などを決めるときに、オブジェクトを「唯一、一つだけ」の状態にすること。

# モジュールの用途（復習）
# ・モジュールのミックスイン(includeとextend)
# ・モジュールを利用した空間名前の作成（モジュール別にクラスを作成）
# ・関数や定数を提供するモジュールの作成
# ・状態を保持するモジュールの作成
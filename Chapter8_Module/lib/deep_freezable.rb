module DeepFreezable
    def deep_freeze(array_or_hash)

        # array or hashでfreezeの処理が異なるため、case文でそれぞれ設定する
        case array_or_hash
        when Array
            # 引数で与えられた配列の個々の値をfreeze
            array_or_hash.each do |element|
                element.freeze
            end
        when Hash
            # ハッシュの中身のキーと値をfreezeする
            array_or_hash.each do |key, value|
                key.freeze
                value.freeze
            end
        end

        # オブジェクト（配列 or ハッシュ）自体をfreeze（これがメソッドの戻り値となる）
        array_or_hash.freeze
    end
end
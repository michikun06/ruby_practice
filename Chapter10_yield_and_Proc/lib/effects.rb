module Effects

    # リバースエフェクトの処理
    def self.reverse
        ->(words) { words.split(' ').map(&:reverse).join(' ') }
    end
    
    # エコーエフェクトの処理
    def self.echo(rate)
        ->(words) do
            # スペース(true)ならそのまま返す
            # スペース以外(false)であれば、rateで指定された回数だけ繰り返す。(joinは全てを連結させるメソッド)
            words.chars.map { |c| c == ' ' ? c : c * rate }.join
        end
    end

    # ラウドエフェクト（大文字&任意の数だけ！追加）の処理
    def self.loud(level)
        ->(words) do
            # スペースで分割　→　文字を全て大文字に変換し、任意の数だけ「!」の付与　→　スペースで連結
            words.split(' ').map { |word| word.upcase + '!' * level }.join(' ')
        end
    end
end
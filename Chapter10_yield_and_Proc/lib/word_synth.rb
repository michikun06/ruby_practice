class WordSynth
    def initialize
        @effects = []
    end

    # 引数のエフェクトを@effects配列に追加していくメソッド
    def add_effect(effect)
        @effects << effect
    end

    def play(original_words)
        @effects.inject(original_words) do |words, effect|
            effect.call(words)
        end
    end
end
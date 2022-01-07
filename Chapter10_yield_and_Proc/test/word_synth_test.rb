require 'minitest/autorun'
require './lib/word_synth'
require './lib/effects'

class WordSynthTest < Minitest::Test

    # エフェクトを適用しない
    def test_play_without_effects
        synth = WordSynth.new
        assert_equal 'Ruby is fun!', synth.play('Ruby is fun!')
    end

    # リバースエフェクトを適用する
    def test_play_with_reverse
        synth = WordSynth.new
        synth.add_effect(Effects.reverse)
        assert_equal 'ybuR si !nuf', synth.play('Ruby is fun!')
    end

    # 複数のエフェクトを適用する
    def test_play_with_many_effects
        synth = WordSynth.new
        synth.add_effect(Effects.echo(2))
        synth.add_effect(Effects.loud(3))
        synth.add_effect(Effects.reverse)
        assert_equal '!!!YYBBUURR !!!SSII !!!!!NNUUFF', synth.play('Ruby is fun!')
    end
end
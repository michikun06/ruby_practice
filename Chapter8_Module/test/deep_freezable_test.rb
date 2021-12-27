require 'minitest/autorun'
require './lib/bank'
require './lib/team'

class DeepFreezableTest < Minitest::Test

    # 配列のチェック
    def test_deep_freezable_to_array

        # 配列が正しい値になっているかチェック
        assert_equal ['Japan', 'US', 'India'], Team::COUNTRIES

        # 配列自体がfreezeになっているかチェック
        assert Team::COUNTRIES.frozen?

        # 配列の要素が全てfreezeになっているかチェック
        assert Team::COUNTRIES.all?{ |country| country.frozen? }
    end

    # ハッシュのチェック
    def test_deep_freezable_to_hash

        # ハッシュの中身が正しい値になっているかチェック
        assert_equal(
            { 'Japan' => 'yen', 'US' => 'dollar', 'India' => 'rupee' },
            Bank::CURRENCIES
        )

        # ハッシュ自体がfreezeになっているかチェック
        assert Bank::CURRENCIES.frozen?

        # ハッシュの要素（キーと値）が全てfreezeになっているかチェック
        assert Bank::CURRENCIES.all?{ |key, value| key.frozen? && value.frozen? }
    end
end
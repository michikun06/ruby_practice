# 意図的に例外を発生させる際はraiseメソッドを使用する
def currency_of(country)
    case country
    when :japan
        'yen'
    when :us
        'dollar'
    when :india
        'rupee'
    else
        raise ArgumentError, "無効な国名です。#{country}"
    end
end

p currency_of(:japan)     #=>"yen"
# p currency_of(:italy)
# intentionally_raise_an_exception.rb:11:in `currency_of': 無効な国名です。italy (ArgumentError)

# エラーメッセージは省略できるがなるべく、避ける。
# 例外処理が行われているのは「プログラムが正常に動いていない証拠」なので、安易にrescueしてしまうとデータが壊れたり、余計にややこしくなる恐れがある。
# 基本的にrescueは使わない。
# 効率的にするためにはrescueを使用する場合がある。その際は必ずrescueした証拠を残す。


# 例外処理よりも条件分岐を行う。
# begin〜rescueを使うよりも、条件分岐を使った方が可読性やパフォーマンスが良くなる。
require 'date'

def convert_heisei_to_date(heisei_text)
    m = heisei_text.match(/平成(?<jp_year>\d+)年(?<month>\d+)月(?<day>\d+)日/)
    year = m[:jp_year].to_i + 1988
    month = m[:month].to_i
    day = m[:day].to_i

    # 正しい日付かどうか確認する（Date.valid_date?()）
    p Date.new(year, month, day).to_s if Date.valid_date?(year, month, day)
end

convert_heisei_to_date('平成28年12月31日')     #=>"2016-12-31"
convert_heisei_to_date('平成28年99月31日')     #=>何も表示されない
# ensure  :  例外の有無に関わらず、実行する処理
file = File.open('some.txt', 'w')     # 書き込みモードでファイルを開く。
begin
    file << 'Hello'
ensure
    file.close
end


# ensureの代わりにブロックを使用する
File.open('some2.txt', 'w') do |file|
    file << 'Hello'
    # 1 / 0
end
# 1 / 0でZeroDivisionErrorが発生するが、openメソッドがにより、自動的にクローズされる。


# 例外処理のelse
# 基本的にelseはあまり使用しない。例外が発生しなかったときに処理が行われる。rescueとensureの間に書く
begin
    puts 'Hello'
    1/0
rescue
    puts '例外が発生しました'
else
    puts '例外が発生しませんでした'
ensure
    puts '例外の有無に関わらず、必ず実行されます'
end


# 例外処理の戻り値
# 例外の戻り値はbegin節の最後の式になる。
# メソッドの戻り値として使用することもできる。


# begin/endはrescueがあることで省略することができる。(rescue修飾子)
require 'date'

def to_date(string)
    Date.parse(string) rescue nil     # Date.parse(string)で例外が発生しなければそのまま戻り値へ、例外が発生したらnilが戻り値へ
end

p to_date('2021-01-01')     #=>#<Date: 2021-01-01 ((2459216j,0s,0n),+0s,2299161j)>
p to_date('abcd')     #=>nil
# この書き方は省略できるが、例外クラスを補足することができない。(何のエラーかわからなくなる)


# 組み込み変数$!と$@に格納される例外情報
# 最後に発生したエラーに限り、例外は$!、バックトレースは$@に格納される
begin
    1 / 0
rescue
    puts "#{$!.class} #{$!.message}"
    puts $@
end

# rubyではメソッドの処理全てが例外処理の場合、begin、endは省略することができる。


# 独自の例外クラスを定義する
class NoCountryError < StandardError
end

def currency_of(country)
    case country
    when :japan
        'yen'
    when :us
        'dollar'
    when :india
        'rupee'
    else
        raise NoCountryError, "無効な国名です。#{country}"
    end
end

p currency_of(:italy)     #=>`currency_of': 無効な国名です。italy (NoCountryError)
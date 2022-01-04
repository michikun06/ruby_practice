# 例外の捕捉
# module Greeter
#     def hello
#         'Hello!'
#     end
# end
# greeter = Greeter.new

# 上のプログラムを実行したら下記のようなエラー文が出る
# Traceback (most recent call last):          この２行は例外が発生するまでのプログラムの実行過程を指している。バックトレースと呼んだりする
# exception_catching.rb:7:in `<main>':          exception_catching.rbファイルの7行目付近でエラーが出ている
#  undefined method `new' for Greeter:Module         これは例外に関するメッセージ「未定義のメソッドであるnewをGreeterモジュールに対して呼び出そうとした。」
#  (NoMethodError)            発生した例外のクラス名


# 例外を捕捉して処理を続行する場合
# エラーが発生してもプログラムを続行したい場合は例外処理を明示的に書くことで、プログラムを続行させることができる。

puts 'Start'

module Greeter
    def hello
        'hello'
    end
end

begin
    greeter = Greeter.new
rescue
    puts '例外が発生したがこのまま処理を実行する。'
end

puts 'End'

# 
# 実行結果
# 
# Start
# 例外が発生したがこのまま処理を実行する。
# End


# 例外オブジェクトから情報を取得する
begin
    1/0
rescue => e
    puts "エラークラス: #{e.class}"
    puts "エラーメッセージ: #{e.message}"
    puts '-----バックトレース-----'
    puts "#{e.backtrace}"
    puts '---------------------'
end

# 
# 実行結果
# 
# エラークラス: ZeroDivisionError
# エラーメッセージ: divided by 0
# -----バックトレース-----
# ["exception_catching.rb:45:in `/'", "exception_catching.rb:45:in `<main>'"]
# ---------------------


# クラスを指定して、捕捉する例外を限定する
# 以下のようにZeroDivisionErrorに限定して、それ以外のエラーが発生した場合は、例外が発生せずにプログラムが異常終了します。
begin
    1/0
rescue ZeroDivisionError
    puts "0で除算しました。"
end

# 
# 実行結果
# 
# 0で除算しました。


# 以下のようにrescueを複数指定で複数の例外クラスに対応することができる。
begin
    'abc'.foo
rescue ZeroDivisionError
    puts "0で除算しました。"
rescue NoMethodError
    puts "存在しないメソッドが呼び出されました。"
end

# 
# 実行結果
# 
# 存在しないメソッドが呼び出されました。

begin
    1/0
rescue ZeroDivisionError, NoMethodError => e
    puts "0で除算したか、存在しないメソッドが呼び出されました。"
    puts "エラー : #{e.class} #{e.message}"
end

# 
# 実行結果
# 
# エラー : ZeroDivisionError divided by 0


# 例外クラスの継承関係
# 通常のプログラムで補足するのはStandardErrorかそれらの子クラスに位置する例外クラスを補足するべき。

# Exception #最上位
#   |--NoMemoryError
#   |--ScriptError
#   |    |--LoadError
#   |    |--SyntaxError
#   |
#   |--StandardError #独自例外クラスを生成する際に継承を推奨されているクラス
#   |   |--ArgumentError
#   |   |--NameError
#   |   |    |--NoMethodError
#   |   |
#   |   |
#   |   |--RuntimeError
#   |   |--TypeError
#   |   |--ZeroDivisionError
#   |
#   |--SystemExit
#   |--SystemStackError


# 継承関係とrescue節の順番に注意する
# rescueが複数ある場合は上から順番にマッチするかチェックされる。
# そのため、例外クラスの継承関係（上の階層構造）に注意する。


# 例外が発生した際にもう一度処理をやり直すretry
retry_count = 0
begin
    puts '処理を開始します。'
    1/0
rescue
    retry_count += 1
    if retry_count <= 3
        puts "retryします。（#{retry_count}回目）"
        retry
    else
        puts "retryに失敗しました。（#{retry_count}回目）"
    end
end

# 
# 実行結果
# 
# 処理を開始します。
# retryします。（1回目）
# 処理を開始します。
# retryします。（2回目）
# 処理を開始します。
# retryします。（3回目）
# 処理を開始します。
# retryに失敗しました。（4回目）
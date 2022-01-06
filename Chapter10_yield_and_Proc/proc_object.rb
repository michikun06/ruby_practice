# Procクラスはブロックをオブジェクト化するためのクラス
hello_proc = Proc.new do
    'Hello!'
end

# hello_proc = Proc.new { 'Hello!' }     do ... endを省略することもできる。

p hello_proc.call     #=>"Hello!"

# 引数を渡すことも可能
add_proc = Proc.new { |a = 1, b = 1| a + b }
p add_proc.call(10, 20)     #=>30
p add_proc.call     #=>2


# Procオブジェクトをブロックの代わりに引数として渡すこともできる
def greeting(&block)
    # 引数として与えられたblockのクラス名を表示する
    puts block.class
    puts 'おはよう'
    text = block.call('こんにちは')
    puts text
    puts 'こんばんは'
end

greeting do |text|
    text * 2
end
#=>Proc
#=>おはよう
#=>こんにちはこんにちは
#=>こんばんは

# 
# Procオブジェクトでは引数を複数受け取ることができたり、blcokをインスタンスとして扱うことができる。
# 
def greeting_2(proc_1, proc_2, proc_3)
    puts proc_1.call('おはよう')
    puts proc_2.call('こんにちは')
    puts proc_3.call('こんばんは')
end

# greeting_2メソッドに渡すProcオブジェクトを用意する
shuffle_proc = Proc.new { |text| text.chars.shuffle.join }
repeat_proc = Proc.new { |text| text * 2 }
question_proc = Proc.new { |text| "#{text}?" }

# 3種類のProcオブジェクトをgreeting_2メソッドに渡す。
greeting_2(shuffle_proc, repeat_proc, question_proc)
#=>はうよお
#=>こんにちはこんにちは
#=>こんばんは?


# 
# Proc.newとlambdaの違いについて
# 

# Proc.newの作成と実行
add_proc_2 = Proc.new { |a = 1, b = 1| a + b }
# add_proc_2 = proc { |a = 1, b = 1| a + b }でも可
p add_proc_2.call(10, 20)     #=>30

# lambdaの作成と実行について
add_lambda = ->(a = 1, b = 1) { a + b }
# add_lambda = lambda{ |a = 1, b = 1| a + b }でも可
p add_lambda.call(10, 20)     #=>30

#【両者の相違点について】
# ・引数のチェックが厳密になる。lambdaの方が厳しい。
#  → 個数に過不足があるとエラー
#  → returnとbreakの挙動が異なる。）

# 両者を判別するにはProcクラスのオブジェクトに対して「lambda?」メソッドを使用する
p add_proc_2.lambda?     #=>false
p add_lambda.lambda?     #=>true
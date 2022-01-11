# eval  :  受けとった文字列をRubyプログラムやOSコマンドとして実行する仕組み
code = '[1, 2, 3].map { |number| number * 10 }'     # 実行したコマンドを変数に代入
p eval(code)     #=>[10, 20, 30]



# バッククォートで囲む(%x{}でも可能)
puts `cat ../Chapter10_yield_and_Proc/proc_object.rb`
#=># Procクラスはブロックをオブジェクト化するためのクラス
#=># hello_proc = Proc.new do
#=>#     'Hello!'
#=># end
#=>
#=># hello_proc = Proc.new { 'Hello!' }     do ... endを省略することもできる。
#=>
#=># p hello_proc.call     #=>"Hello!"
#=>
#=># # 引数を渡すことも可能
#=># add_proc = Proc.new { |a = 1, b = 1| a + b }



# sendメソッド  :  指定したレシーバに対して引数のメソッドを適用させる
string = 'a,b,c'
p string.send('upcase')     #=>"A,B,C"
p string.send('split', ',')     #=>["a", "b", "c"]
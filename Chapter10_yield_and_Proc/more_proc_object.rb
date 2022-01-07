# 
# Procオブジェクトを実行する様々な方法
# 
add_proc = Proc.new { |a, b| a + b }

# ① callメソッドを使う
p add_proc.call(10, 20)     #=>30

# ② yieldメソッドを使う
p add_proc.yield(10 ,20)     #=>30

# ③ .()を使う
p add_proc.(10, 20)     #=>30

# ④ []を使う
p add_proc[10, 20]     #=>30

# ⑤ ===を使う
p add_proc === [10, 20]     #=>30



# 
# &とto_procメソッド
# 
# シンボルにもto_procメソッドを持っている
split_proc = :split.to_proc
p split_proc.call('a-b-c-d e')     #=>["a-b-c-d", "e"]
p split_proc.call('a-b-c-d e', '-')     #=>["a", "b", "c", "d e"]   第二引数で指定した文字で区切る
p split_proc.call('a-b-c-d e', '-', 3)     #=>["a", "b", "c-d e"]   第二引数で指定した文字で区切る、第三引数で指定した数だけ



# 
# Procオブジェクトとクロージャ
# 
def generate_proc(array)
    counter = 0
    # メソッドの戻り値はProcオブジェクト
    Proc.new do
        # Procオブジェクトが呼ばれるたびにローカル変数counterに数字が追加されていく
        counter += 10
        # メソッド引数arrayにcounterの値を追加していく
        array << counter
    end
end

values = []
sample_proc = generate_proc(values)
p values     #=>[]

# Procオブジェクトを実行することでcounterも加算されていく
sample_proc.call
p values     #=>[10]
sample_proc.call
p values     #=>[10, 20]

# メソッドが生成されたときの、コンテキスト(変数情報)を保持しているメソッドのことをクロージャ(関数閉包)という。（今回であればgenerate_procメソッドがクロージャとなる）



# 
# Proc.newとlambdaの違い(returnとbreak)
# 
def proc_return
    f = Proc.new { |n| return n * 10 }
    ret = [1, 2, 3].map(&f)
    "ret : #{ret}"
end

def lambda_return
    f = ->(n) { return n * 10 }
    ret = [1, 2, 3].map(&f)
    "ret : #{ret}"
end

p proc_return     #=>10
p lambda_return     #=>"ret : [10, 20, 30]"

# Proc.newで作成されたprocオブジェクトはreturnを使うとメソッドを抜けてしまうため、「10」ができた時点で処理が終了する。
# breakの場合はエラーが発生する。
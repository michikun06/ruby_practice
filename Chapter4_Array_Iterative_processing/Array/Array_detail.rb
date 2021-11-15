# 配列の取得方法
a = [1, 2, 3, 4, 5]

p a[1, 3]      # 一つ目から三つ分の要素を取得
p a.values_at(0, 2, 3)      # ()内の要素を取得
p a[a.size - 1]      # 最後の要素を取得
p a[-1]      # 最後の要素を取得
p a[-3, 2]      # 最後から三番目の要素から二つ取得
p a.last(2)      # 最後の要素から2番目以降を取得
p a.first(2)      # 最初の要素から2番目までを取得


# 配列の追加、変更方法
b = [1, 2, 3, 4, 5, 6]

b << 1     # 配列の最後に1を追加する
b.push(1)     # 配列の最後に1を追加する
b[1, 3] = 100     # 配列の1番目から3要素分削除して、100をいれる
b.delete(1)     # 配列内の１を全て削除する


# 配列の連結
c = [1, 2, 3]
d = [4, 5, 6]

c.concat(d)     # cとdの配列を連結する（破壊的 : dはそのまま、cは連結後の配列）
e = a + b     # aとbの配列を連結する（非破壊的 : a、bはそのままで新しい配列が作成される）


# 配列の和集合、差集合、積集合（| - &、非破壊的）
f = [1, 2, 3]
g = [3, 4, 5]

p f | g     # 配列の和集合を求める（fとgの配列に含まれる要素を取得し、重複しないようにして返す）
p f - g     # 配列の差集合を求める（fの配列からgの配列に含まれる要素を取り除く）
p f & g     # 配列の積集合を求める（fとgの両方に含まれている要素を取得する）


# 多重代入で残りの全要素を配列として受け取る
h, *i = 100, 200, 300     # iに残った要素の全てのデータが入る


# 配列一つを複数の引数として展開する(配列名の前にアスタリスクをつける)
f.push(*g)


# メソッドの可変長引数（個数に制限のない引数）
def greeting(*names)
    puts "#{names.join("と")}、こんにちは！"
end

greeting("川路さん", "田中さん")


# ==で等しいかどうかを判定する
p [1, 2, 3] == [1, 2, 3]
p [1, 2, 3] == [1, 2, 4]


# %記法で文字列の配列を簡潔に作る(下記二つとも同じ)
p ["melon", "apple", "orange"]
p %w!melon apple orange!


# 文字列から配列を作成する
p "Ruby".chars     # ""内の文字列を一文字ずつ取り出して配列に格納する
p "Ruby,Java,PHP,Perl".split(",")     # split(",")の「,」を区切りとして配列を作成する


# 配列に初期値を設定する方法
j = Array.new(5)     # 要素が5個与えられた（初期値はないのでnil）配列j
k = Array.new(5, 0)     # 要素が5個与えられた配列k(初期値は0)

# ※初期値を与えると要素を指定しても、全ての要素の参照元が同じになってしまうので注意
l = ["default", "default", "default", "default", "default"]
initial_value_1 = l[0]
initial_value_1.upcase!

m = Array.new(5, "default")
initial_value_2 = m[0]
initial_value_2.upcase!


# Rubyにおいて常にイミュータブルなクラス
# ・数値(Integer, Float)
# ・シンボル
# ・Trueクラス、Falseクラス
# ・nil
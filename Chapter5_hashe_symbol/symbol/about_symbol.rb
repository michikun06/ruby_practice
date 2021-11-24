# シンボル : シンボルを表すクラスのこと。一対一に対応するオブジェクトのこと。文字列に似ている。

p :apple.class     #=>Symbol
p "apple".class     #=>String

# シンボルの特徴として以下がある
# ・イミュータブル（不変）
# ・同じシンボルであれば同じオブジェクト（オブジェクトIDが同じ）
# ・文字列に比べてメモリ消費が少ない（高速）

# 用途 : 名前を識別できるようにしたいが、その名前が「文字列」でなくても良い時

currencies = { :japan => "yen",  :us => "dollar", :italy => "euro" }
p currencies     #=>{:japan=>"yen", :us=>"dollar", :italy=>"euro"}
array = [1, 2, 3]

# 変更
array[0] = 20
p array     #=> [20, 2, 3]

# 追加
array[3] = 4
array << 5
p array     #=> [20, 2, 3, 4, 5]

# 削除(delete_at)
array.delete_at(1)
p array     #=> [20, 3, 4, 5]
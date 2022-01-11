# Ruby標準の日付や時刻を扱うライブラリ

# 
# ・Timeクラス
# 
time = Time.new(2021, 7, 13, 23, 30, 59)
p time     #=>2021-07-13 23:30:59 +0900


# 
# ・Dateクラス
# 
require 'date'     # dateライブラリをrequireすることでDateクラス、DateTimeクラスを使用することができる

p time_date = Date.new(2021, 7, 13)     #=>#<Date: 2021-07-13 ((2459409j,0s,0n),+0s,2299161j)>


# 
# ・DateTimeクラス
# 
p time_date_time = DateTime.new(2021, 7, 13, 23, 30, 59)     #=>#<DateTime: 2021-07-13T23:30:59+00:00 ((2459409j,84659s,0n),+0s,2299161j)>

# +0900や+00:00は標準時刻との差異（時差）を表している。
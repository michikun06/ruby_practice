# 環境変数  :  ENVという組み込み定数に格納される
# 起動時引数  :  起動する際に設定した引数を呼び出すことができる。ARGV[]で呼び出し可能

# 予め設定した起動時引数をnameに格納
name = ENV['MY_NAME']

# 設定した起動時引数を変数に格納（[]内の数字で順番を指定する）
email = ARGV[0]
age = ARGV[1]

puts "名前 : #{name}"
puts "アドレス : #{email}"
puts "年齢 : #{age}"

# ruby environmental_variable.rb michikun06@icloud.com 23
#=> 名前 : MICHIHIRO
#=> アドレス : michikun06@icloud.com
#=> 年齢 : 23
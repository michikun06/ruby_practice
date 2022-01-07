print "Text?: "     # printで書くことで改行されないため、次の入力がそのまま右横に来る
text = gets.chomp     # getsメソッドはKernelメソッドなのでどこでも使用可能。chompで改行(\n)を取り除いてから変数に格納

begin
    print "Pettern?: "
    pattern = gets.chomp     # チェックしたい正規表現を入力する。
    regexp = Regexp.new(pattern)
rescue RegexpError => e     # RegexpErrorの時のみrescueする
    puts "Invalid pattern(正規表現に間違いがあります。): #{e.message}"
    retry
end

matches = text.scan(regexp)     # 入力内容が正規表現にマッチするかチェックする
if matches.size > 0     # 一つでもマッチするとき
    puts "Matched: #{matches.join(', ')}"     # マッチした部分を区切って表示
else
    puts "Nothing matched."
end
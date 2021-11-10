=begin
【Fizz Buzzプログラム】
引数として与えられた数字が
・15で割り切れる場合は「Fizz Buzz」
・3で割り切れる場合は「Fizz」
・5で割り切れる場合は「Buzz」
を返す関数
=end

def fizz_buzz(number)
	if number % 15 == 0
		"Fizz Buzz"
	elsif number % 3 == 0
		"Fizz"
	elsif number % 5 == 0
		"Buzz"
	else
		number.to_s
	end
end

# puts fizz_buzz(1)
# puts fizz_buzz(2)
# puts fizz_buzz(3)
# puts fizz_buzz(4)
# puts fizz_buzz(5)
# puts fizz_buzz(6)
# puts fizz_buzz(15)

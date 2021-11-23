puts "----------break例----------"
# break : 繰り返し処理を脱出することができる
numbers = [1, 2, 3, 4, 5].shuffle
numbers.each do |number|
    puts number
    break if number == 1
end

puts "----------next例① ----------"
# next : 繰り返し処理を途中で中断して次の繰り返し処理に進める場合に使う
next_box = [1, 2, 3, 4, 5, 6]
next_box.each do |number|
    next if number.even?     # 偶数であれば処理を抜け出して次の処理を行う
    puts number
end

puts "----------next例② ----------"
fruits = %w[melon apple orange]
fruit_numbers = [1, 2, 3, 4]
fruits.each do |fruit|
    fruit_numbers.each do |number|
        next if number.even?
        puts "#{number} : #{fruit}"
    end
end

puts "----------redo例----------"
# redo : 繰り返しをやり直したいときに使用する
foods = %w[ピーマン トマト レタス]
foods.each do |food|
    answer = ["嫌い", "好き"].sample
    puts "#{food}が" + answer
    puts answer == "嫌い" ? "-----は？？？？" : "-----よろしい"
    redo unless answer == "好き"
end
# yieldを使ってブロックの処理を呼び出す
def greeting
    puts 'おはよう'
    puts 'こんばんは'
end

# メソッドの呼び出し方法①
greeting
#=>おはよう
#=>こんばんは

# メソッドの呼び出し方法②
greeting do
    puts 'こんにちは'
end
#=>おはよう
#=>こんばんは

# メソッド内にyieldを展開したメソッド
def greeting_with_yield
    puts 'おはよう'
    yield     # ブロックの処理を呼び出すyieldを展開
    yield
    puts 'こんばんは'
end

greeting_with_yield do
    puts 'こんにちは'
end
#=>おはよう
#=>こんにちは
#=>こんにちは
#=>こんばんは

# ※yieldは書いた分だけ繰り返される。
# ※ブロックが渡されたかどうかを判断するためにはblock_given?メソッドを使用(true or false)
def greeting_check
    puts 'おはよう'
    if block_given?
        yield     # ブロックの処理を呼び出すyieldを展開
    end
    puts 'こんばんは'
end

greeting_check
#=>おはよう
#=>こんばんは

greeting_check do
    puts 'こんにちは'
end
#=>おはよう
#=>こんにちは
#=>こんばんは


# ブロックを引数として受け取る場合は「&引数」、呼び出すときに「引数.call」とする。(引数名はblockだが、自由に設定可能。しかし、一つまで)
def greeting_2(&block)
    puts 'おはよう'
    text = block.call('こんにちは')
    puts text
    puts 'こんばんは'
end

greeting_2 do |text|
    text * 2     # |text| text * 2が引数として&blockに渡される。
end
#=>おはよう
#=>こんにちはこんにちは
#=>こんばんは

# ブロックを引数として受け取れることのメリット
# ①ブロックを他のメソッドに引き渡すことができるようになる。
# ②渡されたブロックに対してメソッドを呼び出し、「必要な情報を取得」したり、
# 「ブロックに対する何かしらの操作をメソッド側で加えたり」することができる。
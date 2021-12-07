# オブジェクト指向プログラミング（OOP）の基礎知識

# クラスを使わない場合
# users = []
# users << { first_name: 'Alice', last_name: 'Ruby', age: 20 }
# users << { first_name: 'Bob', last_name: 'Python', age: 30 }

# def full_name(user)
#     "#{user[:first_name]} #{user[:last_name]}"
# end

# users.each do |user|
#     puts "名前 : #{full_name(user)}、年齢 : #{user[:age]}歳"
# end

#=> 名前 : Alice Ruby、年齢 : 20歳
#=> 名前 : Bob Python、年齢 : 30歳


# クラスを使った場合
## クラスの定義
class User
    attr_reader :first_name, :last_name, :age

    def initialize(first_name, last_name, age)
        @first_name = first_name
        @last_name = last_name
        @age = age
    end

    ## 氏名を作成するメソッド
    def full_name(user)
        "#{user.first_name} #{user.last_name}"
    end
end

# ユーザーのデータ作成
users = []
users << User.new('Alice', 'Ruby', 20)
users << User.new('Bob', 'Python', 30)

# ユーザーのデータを表示する
users.each do |user|
    puts "氏名 : #{user.full_name(user)}、年齢 : #{user.age}歳"
end












# Ruby標準のファイルやディレクトリを扱うクラスについて

# ・Fileクラス
# ・Dirクラス
# ・FileUtilsモジュール
# ・Pathnameクラス

# ※ Fileクラス、Dirクラスは組み込みライブラリなのでrequireなしで使うことができる。

# カレントディレクトリに"secret.txt"が存在するか
p File.exists?('./secret.txt')     #=>false
p Dir.exists?('./secret.txt')     #=>false

# more_proc_object.rbの行数を表示
File.open('../Chapter10_yield_and_Proc/more_proc_object.rb', 'r') do |data|
    puts data.readlines.count      #=>81
end

File.open('./hello.txt', 'w') do |data|
    data.puts 'Hello World!'
end


# FileUnitsモジュールはコピー、削除などの基本的なメソッドが定義されている。
require 'fileutils'

# カレントディレクトリにhello.txtをhello_world.txtにリネームして複製する
FileUtils.copy('./hello.txt', './hello_world.txt')


# Pathnameクラスはパス名をオブジェクト指向らしく扱うためのクラス 
require 'pathname'

# カレントディレクトリ配下にある"Chapter12_Ruby_topic"を表すオブジェクトを作る
chapter12 = Pathname.new('../Chapter12_Ruby_topic')
p chapter12.file?     #=>false
p chapter12.directory?     #=>true

# chapter12ディレクトリ配下にあるhello_world.txtへのパス文字列を作る
p chapter12.join('hello_world.txt')
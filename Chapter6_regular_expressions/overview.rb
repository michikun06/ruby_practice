# 正規表現とはメタ記号と呼ばれる「記号」と「文字列」を組み合わせた構文のことで、検索対象となる文章中から任意のパターン文字列パターンを検索できる一種の「ミニ言語」である
# 正規表現を扱うためには以下の二つを習得する必要がある。
# ・Rubyにおける正規表現オブジェクトの使い方
# ・正規表現そのものの使い方


# 正規表現の例①
text = <<TEXT     # ヒアドキュメントTEXTまでが認証される
I love Ruby.
Python is great language.
Java and Javascript are different.
TEXT

program_language = text.scan(/[A-Z][A-Za-z]+/)
p program_language     #=> ["Ruby", "Python", "Java", "Javascript"]

# 正規表現の例②
text = <<TEXT
私の郵便番号は1234567
僕の住所は6770056 兵庫県西脇市板波町1234です。
TEXT

puts text.gsub(/(\d{3})(\d{4})/, '〒\1-\2')


# 次回より下記の記事を参考にして正規表現を学習します。
# その1 : https://qiita.com/jnchito/items/893c887fbf19e17d3ff9
# その2 : https://qiita.com/jnchito/items/64c3fdc53766ac6f2008
# その3 : https://qiita.com/jnchito/items/6f0c885c1c4929092578
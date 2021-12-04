# 学ぶこと
# ・\d、{n,m}、{n}、[AB]、[a-z]の意味
# ・正規表現の正確さと複雑さの関係

data = <<-TEXT
名前：伊藤淳一
電話：03-1234-5678
住所：兵庫県西脇市板波町1-2-3
TEXT
puts data.scan /\d\d-\d\d\d\d-\d\d\d\d/

text = <<-TEXT
名前：伊藤淳一
電話：03(1234)5678
？？：9999-99-9999
？？：03(1234-5678
住所：兵庫県西脇市板波町1-2-3
TEXT

numbers = text.scan(/0[1-9]\d{0,3}[-(]\d{1,4}[-)]\d{4}/)     # 1文字目は0、2文字目は0以外の半角数字
p numbers
p numbers.grep(/\(\d+\)|-\d+-/)


# 本記事で学んだこと
# \d は「半角数字1文字」を表す
# {n,m} は「直前の文字が n 文字以上、m 文字以下」であることを表す
# {n} は「直前の文字がちょうど n 文字」であることを表す
# [AB] は「AまたはBが1文字」であることを表す
# [a-z] はaからz、 [-az] aまたはzまたはハイフンのいずれか1文字という意味がある
# 正規表現の正確さと複雑さはトレードオフになることが多い
# リーダブルにするために工夫したこと

## 変数名

URL: https://github.com/yukokondo/yukokondo-readable-code/commit/1450faacf6f456c9150630c2c46900c7f0d4ed56

コード：
```
f = open(ARGV[0])
f.each {|recipi| print recipi}
f.close
```

理由：変数の名前を具体的にした（recipi、など）。

## 実行手順を初心者向けに

URL: https://github.com/yukokondo/yukokondo-readable-code/commit/3d039525c5d94decf9e240931416944e10be5268

README.md：

ファイルのあるディレクトリに移動し、コンソールで以下を入力する。
```
ruby recipi.rb
```

理由：Rubyが分からない人にも分かりやすくするために。

## 実行手順を汎用的に

URL: https://github.com/yukokondo/yukokondo-readable-code/commit/0c38fe1969fb46b984710263af33892a8f0e7e78

README.md：
ファイルのあるディレクトリに移動し、コンソールで以下を入力する。
```
ruby recipi.rb [データファイル名]
```

今回の仕様の例だと下記の通り。
```
ruby recipi.rb recipi-data.txt
```

理由：
汎用的な表現も追加し、他のファイルを参照する場合の変更にも分かりやすくなるように気をつけた。

## 変数名の変更

URL: https://github.com/yukokondo/yukokondo-readable-code/commit/9261fc6ca852bf4227382ad45176b0286d9b33e2

recipi_data = open(ARGV[0]).read
recipi_name = JSON.parse(recipi_data)

→

recipi_json = open(ARGV[0]).read
recipi_name = JSON.parse(recipi_json)

理由：recipi_◯◯が続いてよくわからないのと、recipi_dataってなんやねん（全部データ）と思ったので、具体的なものに変更。


## ↑仕様間違えました。。。

# 他の人のコードを読んで気づいたこと

## 使う人のいろんな環境への対応

URL: https://github.com/yukokondo/myokoym-readable-code-workshop-ruby/commit/d584aa193c369071f8fc0791df193778744a4c48

引数にデータファイルを指定して、Rubyインタープリターでrecipe.rbを実行してください。

以下はコマンドライン（bashやコマンドプロンプトなど）で実行する例です。

```bash
$ ruby recipe.rb recipe-data.txt
```

UnixやLinuxなどの環境では、以下のように実行することもできます。

```bash
$ ./recipe.rb recipe-data.txt
```

もし環境変数のPATHが通っていない場合、絶対パスで指定してください。

```bash
$ /path/to/ruby recipe.rb recipe-data.txt
```

理由：自分とは違う環境の人に配慮している。パスが通ってない場合までも配慮。



## コンソールから入力した値を、意味のある変数に渡している

URL: https://github.com/yukokondo/myokoym-readable-code-workshop-ruby/commit/9cc9095a786241ba0e669ea340c167edcace239a

コード：
data_path = ARGV[0]

puts File.read(data_path)

理由：仕様1と、連続性のある拡張をしている。一行あけているのもいい。


## 読み込む操作のメソッドを定義している。

URL: https://github.com/yukokondo/myokoym-readable-code-workshop-ruby/commit/922ea8e6cf43019fe43e6c892ad3ddd4c2bba2f4

コード：
def read_lines(data_path)
  recipes = []
  File.open(data_path, "r") do |file|
    file.each_line do |line|
      recipes << line
    end
  end
  recipes
end

理由：データの読み込みをメソッドで定義しているので、拡張するときによさそう。メソッド名も何をするのかがわかりやすい。

## データの入れ方によって、単数形と複数形を分けている

URL: https://github.com/yukokondo/myokoym-readable-code-workshop-ruby/commit/922ea8e6cf43019fe43e6c892ad3ddd4c2bba2f4

コード：
recipes.each do |recipe|
  puts recipe
end

理由：recipesとrecipeは、単純に、単数形／複数形としているだけで、クラスも違うけれど、それだけでデータがどのように入っているかイメージしやすくていい。

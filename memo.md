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

理由：
汎用的な表現も追加し、他のファイルを参照する場合の変更にも分かりやすくなるように気をつけた。

## 変数名の変更

URL: https://github.com/yukokondo/yukokondo-readable-code/commit/9261fc6ca852bf4227382ad45176b0286d9b33e2

```
recipi_data = open(ARGV[0]).read
recipi_name = JSON.parse(recipi_data)
```
→
```
recipi_json = open(ARGV[0]).read
recipi_name = JSON.parse(recipi_json)
```

理由：recipi_◯◯が続いてよくわからないのと、recipi_dataってなんやねん（全部データ）と思ったので、具体的なものに変更。

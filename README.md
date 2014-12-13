# md2pdf
markdownファイルをpdfに変換するスクリプトです  
スタイルシートはgithubのcssをベースに改造されたものを使っています  
[andyferra/github.css](https://gist.githubusercontent.com/andyferra/2554919/raw/2e66cabdafe1c9a7f354aa2ebf5bc38265e638e5/github.css)

## インストール
まず以下の物が必要です

- ruby
- pandoc
- wkhtmltopdf

Macだとこれでインストールできます

```
brew install pandoc
brew cask install wkhtmltopdf
```

## 使い方

- -i --input 変換するmarkdownファイル
- -c -css    使用するスタイルシート

#### 例
`md2pdf -i test.md`  
`md2pdf -i test.md -c mystyle.css`

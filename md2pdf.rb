#!/usr/bin/env ruby

markdown_file = ARGV.shift
basename = File.basename markdown_file, '.md'
html_file = basename + '.html'
pdf_file = basename + '.pdf'
style = '~/style/GitHub2.css'
wkhtmltopdf_option = "--javascript-delay 25000  --user-style-sheet #{style}"

system "pandoc #{markdown_file} --mathjax -s -c #{style} -o #{html_file}"
system "wkhtmltopdf #{wkhtmltopdf_option} #{html_file} #{pdf_file}"

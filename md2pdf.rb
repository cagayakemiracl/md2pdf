#!/usr/bin/env ruby

require 'pathname'

this_dir = File.dirname Pathname.new(__FILE__).realpath

markdown_file = ARGV.shift
basename = Pathname(markdown_file)
html_file = basename.sub_ext('.html').to_s
pdf_file = basename.sub_ext('.pdf').to_s

style = File.expand_path 'github2.css', this_dir

delay_time = 25_000
wkhtmltopdf_option = "--javascript-delay #{delay_time} --footer-center [page]"

system "pandoc #{markdown_file} --mathjax -s -c #{style} -o #{html_file}"
system "wkhtmltopdf #{wkhtmltopdf_option} #{html_file} #{pdf_file}"

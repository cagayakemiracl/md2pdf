#!/usr/bin/env ruby

require 'pathname'
require 'optparse'

this_dir = File.dirname Pathname.new(__FILE__).realpath
defalut_style = File.expand_path 'github.css', this_dir

params = ARGV.getopts(
  '',
  "css:#{defalut_style}",
  'input:not_found_file')

exit 0 if params['input'] == 'not_found_file'

markdown_input_file = params['input']
style = params['css']

basename = Pathname(markdown_input_file)
html_file = basename.sub_ext('.html').to_s
pdf_file = basename.sub_ext('.pdf').to_s

pandoc_option = "--mathjax -s -c #{style} -t html5"

delay_time = 30_000
wkhtmltopdf_option = "--javascript-delay #{delay_time} --footer-center [page]"

system "pandoc #{pandoc_option} #{markdown_input_file} -o #{html_file}"
system "wkhtmltopdf #{wkhtmltopdf_option} #{html_file} #{pdf_file}"

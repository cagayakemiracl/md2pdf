#!/usr/bin/env ruby

require 'pathname'
require 'optparse'

params = ARGV.getopts(
  '',
  'css:github',
  'input:not_found_file')

exit 0 if params['input'] == 'not_found_file'

this_dir = File.dirname Pathname.new(__FILE__).realpath
if params['css'] == 'github'
  style = File.expand_path 'github2.css', this_dir
else
  style = params['css']
end

markdown_file = params['input']
basename = Pathname(markdown_file)
html_file = basename.sub_ext('.html').to_s
pdf_file = basename.sub_ext('.pdf').to_s

delay_time = 25_000
wkhtmltopdf_option = "--javascript-delay #{delay_time} --footer-center [page]"

system "pandoc #{markdown_file} --mathjax -s -c #{style} -o #{html_file}"
system "wkhtmltopdf #{wkhtmltopdf_option} #{html_file} #{pdf_file}"

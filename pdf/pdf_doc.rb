require File.expand_path(File.dirname(__FILE__) + "/../doc.rb")

html_file = ARGV[0]
pdf_file = html_file.gsub(".html", ".pdf")
puts "Turning #{html_file} into #{pdf_file}"
Doc.create_brownbag_pdf(File.read(html_file), pdf_file, html_file.include?("_js"))

system("open #{pdf_file}")

require File.expand_path(File.dirname(__FILE__) + "/doc.rb")

html_file = ARGV[0]
pdf_file = html_file.gsub(".xml", ".pdf")
Doc.create_brownbag_pdf(File.read(html_file), pdf_file)

system("open #{pdf_file}")

require File.expand_path(File.dirname(__FILE__) + "/doc.rb")

html_file = ARGV[0]
excel_file = html_file.gsub(".xml", ".xls")
Doc.create_brownbag_xls(File.read(html_file), excel_file)


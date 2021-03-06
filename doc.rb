# Once you put your API key in below, you can run this using
# ruby straight_ruby_example.rb
# and two files docraptor_sample.pdf and docraptor_sample.xls will be created in the current directory
require File.expand_path(File.dirname(__FILE__) + "/apikey.rb")

class Doc
  require 'rubygems'
  require 'httparty'
  include HTTParty

  base_uri "https://docraptor.com"

  # returns a string that is the document data
  def self.create(document_information)
    post("/docs", :body => {:doc => document_information}, :basic_auth => {:username => API_KEY})
  end
  
  def self.create_brownbag_xls(document_content, filename = "brownbag_sample.xls")
    File.open(filename, "w+") do |f|
      f.write Doc.create(:document_content => document_content,
                         :name => "brownbag_sample.xls",
                         :document_type => "xls",
                         :test => false)
    end
  end
  
  def self.create_brownbag_pdf(document_content, filename = "brownbag_sample.pdf", javascript = false)
    File.open(filename, "w+") do |f|
      f.write Doc.create(:document_content => document_content,
                         :name => filename,
                         :document_type => "pdf",
                         :test => false,
                         :javascript => javascript)
    end
  end
end

# File.open("docraptor_sample.xls", "w+") do |f| 
#   f.write Doc.create(:document_content => "<table name='My First Sheet'><tr><td>Cell 1</td><td>Cell 2</td></tr></table>",
#                      :name             => "docraptor_sample.xls",
#                      :document_type    => "xls",
#                      :test             => true)
# end

# File.open("docraptor_sample.pdf", "w+") do |f|
#   f.write Doc.create(:document_content => "<html><body>Text in a PDF</body></html>",
#                      :name             => "docraptor_sample.pdf",
#                      :document_type    => "pdf",
#                      :test             => true)
# end

# Doc.create_brownbag_xls("<table name='My First Sheet'><tr><td>Cell 1</td><td>Cell 2</td></tr></table>")

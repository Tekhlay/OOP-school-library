require 'fileutils'

def create_directory
  Dir.exist?('./datasource') ? nil : create_files
end

def create_files
  Dir.mkdir('./datasource')
  FileUtils.touch('./datasource/book.json')
  FileUtils.touch('./datasource/user.json')
  FileUtils.touch('./datasource/rental.json')
end
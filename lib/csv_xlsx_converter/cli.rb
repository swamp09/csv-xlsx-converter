# encoding: UTF-8

require_relative "filename"

module CsvXlsxConverter
  def self.handle_in param
    input = param[0]

     if self.csv_filename? input
       conv = self::CsvToXlsx.new input
       output = self.to_xlsx_filename input
       conv.convert output

     elsif self.xlsx_filename? input
       conv = self::XlsxToCsv.new input
       output = self.to_csv_filename input
       conv.convert output

     else
       puts "not vaild argv"
       puts "input: #{input}"
     end
  end

  def self.handle_inout param
    input = param[0]
    output = param[1]

    begin
      if self.csv_filename? input
        conv = self::CsvToXlsx.new input
        conv.convert output

      elsif self.xlsx_filename? input
        conv = self::XlsxToCsv.new input
        conv.convert output
      end
    rescue
      puts "not vaild argv"
      puts "input: #{input}"
      puts "output: #{output}"
    end
  end

  def self.main
    if ARGV.size == 1
      handle_in ARGV
    elsif ARGV.size == 2
      handle_inout ARGV
    else
      puts "Usage: #{$0} <input:*.csv/*.xlsx>"
      puts "Usage: #{$0} <input:*.csv/*.xlsx> <output:*.cvs/*.xlsx>"
    end
  end
end

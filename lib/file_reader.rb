require 'json'
require_relative './customer.rb'

class FileReader
  attr_accessor :file

  def initialize file_path
    @file = File.open(file_path)
  end

  def parse
    puts "No input file supplied" unless File.exists?(@file)

    contents = IO.readlines(@file)

    [].tap do |customers|
      contents.each do |line|
        customers << Customer.new(JSON.parse(line))
      end
    end
  end
end

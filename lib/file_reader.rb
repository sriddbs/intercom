require 'json'
require_relative './customer.rb'

class FileReader
  attr_accessor :file

  def initialize file_path
    @file = File.open(file_path)
  end

  def parse
    contents = IO.readlines(@file)

    if @file.nil? || !File.exists?(@file) || contents.empty?
      puts "Please provide correct file"
      exit
    end

    [].tap do |customers|
      contents.each do |line|
        customers << Customer.new(JSON.parse(line))
      end
    end
  end
end

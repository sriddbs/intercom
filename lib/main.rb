require_relative './invite_service'
require_relative './file_reader.rb'

f = FileReader.new(File.join(__dir__, "customers.json"))
customers = f.parse

service = InviteService.new
puts "*" * 100
puts "Customers to invite"
puts "*" * 100
puts service.invitable_customers(customers).inspect

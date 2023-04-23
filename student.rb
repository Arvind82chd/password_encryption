require_relative 'crud'

class Student
include Crud
  attr_accessor :first_name, :last_name, :email, :username, :password

  def initialize(firstname, lastname, username, email, password)
    @first_name = firstname
    @last_name = lastname
    @username = username
    @email = email
    @password = password
  end

  def to_s
    "First name: #{@first_name}, Last name: #{@last_name}, User name: #{@username}, Email: #{@email}, Password: #{@password}"
  end
  
end

student1 = Student.new("Ari", "Hussainpuria", "ari_h", "ari@abc.com", "pwd1")
student2 = Student.new("Chaman", "Basantpuria", "chaman", "c@abc.com", "pwd2")

puts student1
puts student2

hashed_password = student1.Crud.create_hash_digest(student1.password)

puts hashed_password
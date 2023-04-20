require 'bcrypt'

users = [
    {username: "a", password: "pwd"},
    {username: "b", password: "pwd1"},
    {username: "c", password: "pwd2"},
    {username: "d", password: "000"},
    {username: "e", password: "111"}
]


def create_hash_digest(password)
  BCrypt::Password.create(password)
end

def verify_hash_digest(password)
  BCrypt::Password.new(password)
end

def create_secure_users(list_of_users)
  list_of_users.each do |user_record|
    user_record[:password] = create_hash_digest(user_record[:password])
  end
  list_of_users
end


create_secure_users(users)

def authenticate_user(username, password, list_of_users)
  list_of_users.each do |user_record|
    if user_record[:username] == username && verify_hash_digest(user_record[:password]) == password
      puts "username and password matched"
      return user_record
    end
  end
  "Wrong credentials"
end

puts authenticate_user('d', '000', users)
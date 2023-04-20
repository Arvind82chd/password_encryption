require_relative 'crud'

# or 

# $LOAD_PATH << "." # If we are in the same directory.
# require 'crud' # if we are not in the same directory, this could be use directly.

users = [
    {username: "a", password: "pwd"},
    {username: "b", password: "pwd1"},
    {username: "c", password: "pwd2"},
    {username: "d", password: "000"},
    {username: "e", password: "111"}
]

hashed_users = Crud.create_secure_users(users)

# puts hashed_users
Crud.authenticate_user('c', 'pwd2', users)
Crud.authenticate_user('a', 'pwd1', users)
#Crud.authenticate_user('e', '111', users)
Crud.authenticate_user('a', '000', users)
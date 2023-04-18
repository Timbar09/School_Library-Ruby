require 'json'

# Define a Ruby object
person = { name: 'John', age: 30, city: 'New York' }

# Convert the object to JSON
json_string = person.to_json

puts json_string

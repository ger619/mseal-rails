# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# Seed to add o to all users role field that is null

# Update all user sign_in_count to 0

user = User.update_all(sign_in_count: '0', current_sign_in_at: '2024-04-19 11:55:46.900403000 -0500', current_sign_in_ip: '0', last_sign_in_ip: '0', last_sign_in_at: '0')

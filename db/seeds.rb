# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Create Users

puts "Creating users..."
users = []
5.times do |i|
  users << User.create!(
    name: "User #{i+1}",
    email: "user#{i+1}@example.com"
  )
end

# Create Posts with associations
puts "Creating posts..."
users.each do |user|
  2.times do |i|
    post = Post.create!(
      title: "Post #{i+1} by #{user.name}",
      content: "This is the content for post #{i+1} by #{user.name}",
      user: user,
      creator: user
    )
    
    # Assign random editors to posts (other users can be editors)
    editors = users.reject { |u| u == user }.sample(rand(1..3))
    editors.each do |editor|
      PostEditor.create!(
        post: post, 
        user: editor, 
      )
    end
  end
end

puts "Seeding completed!"
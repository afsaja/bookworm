
usernames = ["aziz", "dina", "kimbell", "michael"]

usernames.each do |username|
  user = User.create
  user.username = username
  user.email = "#{username}@example.com"
  user.password = "12341234"
  user.save
end

puts "There are now #{User.count} users in the database."

book_info = [
  {
    :image_url => "http://upload.wikimedia.org/wikipedia/commons/thumb/e/e9/Lake_Bondhus_Norway_2862.jpg/1280px-Lake_Bondhus_Norway_2862.jpg",
    :description => Faker::Hipster.paragraph,
    :length => Faker::Number.number(3),
    :year => Faker::Number.between(1800, 2016),
    :title => Faker::Book.title,
    :author_id => rand(1..4)
  },
  {
    :image_url => "http://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Lanzarote_5_Luc_Viatour.jpg/1280px-Lanzarote_5_Luc_Viatour.jpg",
    :description => Faker::Hipster.paragraph,
    :length => Faker::Number.number(3),
    :year => Faker::Number.between(1800, 2016),
    :title => Faker::Book.title,
    :author_id => rand(1..4)
  },
  {
    :image_url => "http://upload.wikimedia.org/wikipedia/commons/thumb/0/02/Fire_breathing_2_Luc_Viatour.jpg/1280px-Fire_breathing_2_Luc_Viatour.jpg",
    :description => Faker::Hipster.paragraph,
    :length => Faker::Number.number(3),
    :year => Faker::Number.between(1800, 2016),
    :title => Faker::Book.title,
    :author_id => rand(1..4)
  },
  {
    :image_url => "http://upload.wikimedia.org/wikipedia/commons/thumb/2/2d/Ніжний_ранковий_світло.jpg/1280px-Ніжний_ранковий_світло.jpg",
    :description => Faker::Hipster.paragraph,
    :length => Faker::Number.number(3),
    :year => Faker::Number.between(1800, 2016),
    :title => Faker::Book.title,
    :author_id => rand(1..4)
  },
  {
    :image_url => "http://upload.wikimedia.org/wikipedia/commons/thumb/d/d7/Mostar_Old_Town_Panorama_2007.jpg/1280px-Mostar_Old_Town_Panorama_2007.jpg",
    :description => Faker::Hipster.paragraph,
    :length => Faker::Number.number(3),
    :year => Faker::Number.between(1800, 2016),
    :title => Faker::Book.title,
    :author_id => rand(1..4)
  },
  {
    :image_url => "http://upload.wikimedia.org/wikipedia/commons/thumb/b/b3/Elakala_Waterfalls_Swirling_Pool_Mossy_Rocks.jpg/1280px-Elakala_Waterfalls_Swirling_Pool_Mossy_Rocks.jpg",
    :description => Faker::Hipster.paragraph,
    :length => Faker::Number.number(3),
    :year => Faker::Number.between(1800, 2016),
    :title => Faker::Book.title,
    :author_id => rand(1..4)
  },
  {
    :image_url => "http://upload.wikimedia.org/wikipedia/commons/thumb/a/a2/Biandintz_eta_zaldiak_-_modified2.jpg/1280px-Biandintz_eta_zaldiak_-_modified2.jpg",
    :description => Faker::Hipster.paragraph,
    :length => Faker::Number.number(3),
    :year => Faker::Number.between(1800, 2016),
    :title => Faker::Book.title,
    :author_id => rand(1..4)
  }
]

users = User.all

users.each do |user|
  user.books.create book_info
end

puts "There are now #{Book.count} books in the database."

books = Book.all

books.each do |book|
  rand(8).times do
    comment = book.comments.build
    comment.user = users.sample
    comment.body = Faker::Hacker.say_something_smart
    comment.save
  end
end

puts "There are now #{Comment.count} comments in the database."

books.each do |book|
  users.sample(rand(users.count)).each do |user|
    favorite = book.favorites.build
    favorite.user = user
    favorite.save
  end
end

puts "There are now #{Favorite.count} favorites in the database."

authornames = [Faker::Name.name, Faker::Name.name, Faker::Name.name, Faker::Name.name]

authornames.each do |authorname|
  author = Author.create
  author.name = authorname
  author.dob = Faker::Number.between(1930, 1990).to_s
  author.bio = Faker::Lorem.paragraph
  author.image_url = ["https://upload.wikimedia.org/wikipedia/commons/a/a7/Pluto-01_Stern_03_Pluto_Color_TXT.jpg", "https://upload.wikimedia.org/wikipedia/commons/8/85/Venus_globe.jpg", "https://upload.wikimedia.org/wikipedia/commons/3/3f/Mercury_Globe-MESSENGER_mosaic_centered_at_0degN-0degE.jpg", "http://solarviews.com/raw/earth/bluemarblewest.jpg", "http://www.jpl.nasa.gov/images/mars/20160421/PIA00407-16.jpg", "https://upload.wikimedia.org/wikipedia/commons/2/2b/Jupiter_and_its_shrunken_Great_Red_Spot.jpg", "http://nssdc.gsfc.nasa.gov/planetary/image/saturn.jpg", "http://space-facts.com/wp-content/uploads/uranus.jpg"].sample
  author.save
end

puts "There are now #{Author.count} authors in the database."

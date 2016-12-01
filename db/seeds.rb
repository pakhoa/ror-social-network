1.upto(20) do |i|
  User.create!([
  	{name: Faker::Name.name, email: Faker::Internet.email, password: "123456", created_at: Faker::Time.between(10.days.ago, Date.today, :all)}
  	])
end

1.upto(50) do |i|
  Post.create!([
  {title: Faker::Hipster.sentence, content: Faker::Hipster.paragraph(20), user_id: 1 + rand(20), created_at: Faker::Time.between(10.days.ago, Date.today, :all)},
    ])
end

1.upto(50) do |i|
  1.upto(10 + rand(10)) do |j|
  	Comment.create!([
  		{post_id: i, content: Faker::Hipster.sentence, user_id: 1 + rand(20), created_at: Faker::Time.between(10.days.ago, Date.today, :all)},
	])
  end
end

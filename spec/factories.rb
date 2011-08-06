Factory.define :user do |user|
  user.name                   "Ty Barho"
  user.email                  "ty@example.com"
  user.password               "testers"
  user.password_confirmation  "testers"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.define :micropost do |micropost|
  micropost.content "Foo Bar"
  micropost.association :user
end

require 'factory_girl'
 
Factory.define :admin, :class=> User do |u|
  u.sequence(:name ){|n| "admin"}
  u.sequence(:email_address ){|n| "admin@admin.com"}
  u.password 'admin'
  u.administrator true
end
 
Factory.define :user do |u|
  u.sequence(:name ){|n| "user#{n}"}
  u.sequence(:email_address ){|n| "user#{n}@test.com"}
  u.password 'pass'
  u.administrator false
end


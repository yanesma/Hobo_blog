require 'factory_girl'
 
Factory.define :author do |a|
  a.sequence(:name ){|n| "author#{n}"}
  a.association(:user)
 end

Factory.define :author_wo_user, :class => Author do |a|
  a.sequence(:name ){|n| "author#{n}"}
  end
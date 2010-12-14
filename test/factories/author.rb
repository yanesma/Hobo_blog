require 'factory_girl'
 
Factory.define :author do |a|
  a.sequence(:name ){|n| "author#{n}"}
 end


require 'factory_girl'

Factory.define :post do |p|
  p.post_date Date.today
  p.sequence(:title ){|n| "title#{n}"}
  p.sequence(:content ){|n| "title#{n}content#{n}"}
  
  p.association :author
end

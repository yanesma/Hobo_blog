require 'factory_girl'

Factory.define :post do |p|
  p.sequence(:title ){|n| "title#{n}"}
  p.sequence(:content ){|n| "title#{n}content#{n}"}
  
end


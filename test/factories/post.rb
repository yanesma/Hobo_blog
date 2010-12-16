require 'factory_girl'

Factory.define :post do |p|
  p.post_date Date.today
  p.sequence(:title ){|n| "title#{n}"}
  p.sequence(:content ){|n| "title#{n}content#{n}"}
  
  p.association :author
end

#Factory.define :post_w , :class => Post, :default_strategy => :build do |a|
#  a.post_date Date.today
#  a.title "tae"
#  a.content "anjing"
#
#  a.association :author
#end


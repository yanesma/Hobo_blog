namespace :app do
desc 'Rebuild the database from scratch'
 
desc 'Fill database with test data'
task :populate=> :environment do
  Rake::Task["db:reset"].invoke
 
  require 'factory_girl'
  Dir['test/factories/*.rb'].each { |f| load f }
 
  p "Manifacturing Objects..."
  
  (1..2).each  {   Factory(:post)  }
  
end
 
end


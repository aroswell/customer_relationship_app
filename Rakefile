
namespace :db do
  desc "Run database schema file"
  task :schema do
    puts "Running schema ..."
    ruby 'db/schema.rb'
  end

  desc "Run seed file to populate database"
  task :seed do
    puts "Attempting to seed data..."
    ruby 'db/seed.rb'
  end
end

# Setting up testing task
task(default: :test)

desc "Run test suite"
task :test do
  puts "Running test suite with Rspec..."
  sh %Q{Rspec spec}
end

# Start the app with this run task
desc "Run the app"
task :run do
  ruby 'controllers/crm.rb'
end
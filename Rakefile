
namespace :db do
  desc "Run database schema file"
  task :schema do
    puts "Running schema ..."
    ruby 'schema.rb'
  end

  desc "Run seed file to populate database"
  task :seed do
    puts "Attempting to seed data..."
    ruby 'seed.rb'
  end
end

# Setting up testing task
task(default: :test)

desc "Run test suite"
task :test do
  puts "Running test suite..."
end

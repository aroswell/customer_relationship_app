
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

  desc "Setup or Reset database - run schema and re-seed"
  task :setup do
    puts "Attempting to setup database and seed data..."
    ruby 'db/schema.rb'
    ruby 'db/seed.rb'
    puts "Setup complete"
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
  ruby 'app/controllers/crm.rb'
end
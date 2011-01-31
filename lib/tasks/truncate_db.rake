namespace :db do
  namespace :truncate do
    desc 'Truncate database tables for development'
    task :truncate_db => :environment do
	  truncation_file = File.join(Rails.root, 'db', 'truncate_holidays.rb')
	  load(truncation_file) if File.exist?(truncation_file)
    end
  end
end
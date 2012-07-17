namespace :db do
  desc "Truncates all data in DB tables, except for schema_migrations"
  task(:truncate) do
    begin
      config = Fuzzycms::Application.config.database_configuration[::Rails.env]
      ActiveRecord::Base.establish_connection(config)
      case config["adapter"]
      when "mysql", "postgresql"
        ActiveRecord::Base.connection.tables.each do |table|
          puts "truncating #{table}"
          ActiveRecord::Base.connection.execute("TRUNCATE #{table}") unless table == "schema_migrations"
        end
      when "sqlite", "sqlite3"
        ActiveRecord::Base.connection.tables.each do |table|
          unless table == "schema_migrations"
            puts "truncating #{table}"
            ActiveRecord::Base.connection.execute("DELETE FROM #{table}")
            ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence where name='#{table}'")
          end
        end
        ActiveRecord::Base.connection.execute("VACUUM")
      end
    rescue Exception => e
      $stderr.puts "Error while truncating. Make sure you have a valid database.yml file and have created the database tables before running this command. You should be able to run rake db:migrate without an error"
      $stderr.puts e
    end
  end
end

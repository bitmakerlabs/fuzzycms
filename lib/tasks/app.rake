
namespace :app do
  desc "Populate the database with development data"
  task :populate => :environment do
    [
        {:first_name => "Homer", :last_name => "Simpson", :email => "home@example.com", :password => "password", :password_confirmation => "password"},
        {:first_name => "Marge", :last_name => "Simpson", :email => "marge@example.com", :password => "password", :password_confirmation => "password"},
        {:first_name => "Lisa", :last_name => "Simpson", :email => "lisa@example.com", :password => "password", :password_confirmation => "password"},
        {:first_name => "Bart", :last_name => "simpson", :email => "bart@example.com", :password => "password", :password_confirmation => "password"}
    ].each do |attributes|
      User.find_or_create_by_email(attributes)
    end
  end
end

require "active_record"

ActiveRecord::Base.logger = ActiveSupport::Logger.new(STDOUT)

if ENV['RACK_ENV'] == 'production'
	require 'uri'
db = URI.parse(ENV['DATABASE_URL'])
db_config = {
    :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :host     => db.host,
    :username => db.user,
    :password => db.password,
    :database => db.path[1..-1],
    :encoding => 'utf8'
  }
else
  db_config = {
    :adapter  => 'sqlite3',
    :database => 'db/database.sqlite3'
  }
end

ActiveRecord::Base.establish_connection(db_config)

Dir.glob("models/*.rb").each do |path|
	require_relative "../#{path}"
end

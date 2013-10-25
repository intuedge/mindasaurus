require "grape"
require "data_mapper"

Dir["./lib/*.rb"].each { |file| require file }
Dir["./models/*.rb"].each { |file| require file }

DataMapper::setup(:default, (ENV["DATABASE_URL"] || "sqlite3://#{Dir.pwd}/db/mindasaurus.db"))
DataMapper.finalize.auto_upgrade!

module Mindasaurus
  class API < Grape::API
    format :json

    get :reminders do
      p params
    end

    get "reminders/:id" do
      p params
    end

    post :reminders do
      Reminders.new_reminder
    end
  end
end


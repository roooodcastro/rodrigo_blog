require 'factory_bot'

RSpec.configure do |config|
  config.before(:suite) do
    begin
      DatabaseCleaner.start
      FactoryBot.find_definitions
      FactoryBot.lint
    ensure
      DatabaseCleaner.clean
    end
  end
end

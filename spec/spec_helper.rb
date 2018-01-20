RSpec.configure do |config|
  require 'rspec/rails'
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Devise::Test::ControllerHelpers, type: :view

end

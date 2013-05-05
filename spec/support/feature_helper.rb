include Warden::Test::Helpers

module FeatureHelpers
  def sign_in user
    login_as user
  end
end

RSpec.configure do |config|
  config.include FeatureHelpers, :type => :feature
end
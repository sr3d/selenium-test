require File.dirname(__FILE__) + '/../test_helper.rb'

class TestSafari < Test::Unit::TestCase
  attr_reader :browser  
  include TestSmartwords
  
  def setup
    
    # caps = Selenium::WebDriver::Remote::Capabilities.new :browser_name => 'safari', :platform => 'WINDOWS'
    # @browser = Selenium::WebDriver.for(:remote, :url => HUB_URL, :desired_capabilities => caps)
  end
end
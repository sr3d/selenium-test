require File.dirname(__FILE__) + '/../test_helper.rb'

# class ExampleTest < MiniTest::Unit::TestCase
# class TestChrome < MiniTest::Spec
class TestChrome < Test::Unit::TestCase
  attr_reader :browser  
  include TestSmartwords
  
  def setup
    caps = Selenium::WebDriver::Remote::Capabilities.chrome #:platform => 'MAC'
    @browser = Selenium::WebDriver.for(:remote, :url => HUB_URL, :desired_capabilities => caps)
  end
end
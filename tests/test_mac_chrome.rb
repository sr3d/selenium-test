require File.dirname(__FILE__) + '/../test_helper.rb'
# require 'ruby-debug'

# class ExampleTest < MiniTest::Unit::TestCase
# class TestChrome < MiniTest::Spec
class TestChrome < Test::Unit::TestCase
  attr_reader :browser  
  include TestSmartwords
  
  def setup
    puts HUB_URL
    caps = Selenium::WebDriver::Remote::Capabilities.chrome #:platform => 'MAC'
    caps.platform = :XP
    caps["name"] = "Alex"
    caps["username"] = "alex_wordnik"
    caps["accessKey"] = "9487779b-701d-4651-bf63-cafdf0f170b5"
    @browser = Selenium::WebDriver.for(:remote, :url => HUB_URL, :desired_capabilities => caps)
  end
end
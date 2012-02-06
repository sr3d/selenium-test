require File.dirname(__FILE__) + '/../test_helper.rb'

class TestIe < Test::Unit::TestCase
  attr_reader :browser
  include TestSmartwords
  
  def setup
    caps = Selenium::WebDriver::Remote::Capabilities.ie #:platform => 'MAC'
    caps.platform = :VISTA
    caps["name"] = "Alex"
    caps["username"] = "alex_wordnik"
    caps["accessKey"] = "9487779b-701d-4651-bf63-cafdf0f170b5"    
    @browser = Selenium::WebDriver.for(:remote, :url => HUB_URL, :desired_capabilities => caps)
  end
end
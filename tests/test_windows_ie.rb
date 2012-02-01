require File.dirname(__FILE__) + '/../test_helper.rb'

class TestIe < Test::Unit::TestCase
  attr_reader :browser
  include TestSmartwords
  
  def setup
    @browser = Selenium::WebDriver.for(:remote, :url => HUB_URL, :desired_capabilities => :ie)
  end
end
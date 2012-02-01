require "rubygems"
require "bundler/setup"

require "test/unit"
require 'socket'
# require 'minitest/autorun'
# require 'mini_shoulda'
# require 'minitest/ci'
require "selenium-webdriver"

HOST_NAME = Socket.gethostname
IS_CI = HOST_NAME == 'dev1.wordnik.com'

HUB_URL = "http://127.0.0.1:4444/wd/hub"

# HUB_URL = "http://127.0.0.1:4445/wd/hub"

module TestSmartwords
  def teardown
    @browser.close
  end
  
  def test_widget
    url = "http://www.smartmoney.com/invest/stocks/profiting-from-stock-buybacks-1327292274324/?link=SM_hp_ls4e&2"
    @browser.get url
    wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
    element = wait.until { @browser.find_element(:class => 'termList') }
    assert element
  end
  
end



require 'ci/reporter/test_unit'
require 'ci/reporter/rake/test_unit_loader'
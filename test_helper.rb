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


# Tunnel to Build server
# HUB_URL = "http://127.0.0.1:4445/wd/hub"

# Tunnel to Soucelabs VM
# HUB_URL = "http://127.0.0.1:4445/wd/hub"
HUB_URL = "http://alex_wordnik:9487779b-701d-4651-bf63-cafdf0f170b5@ondemand.saucelabs.com:80/wd/hub"  # same as proxying to 127.0.0.1

module TestSmartwords
  def teardown
    @browser.close
  end
  
  def skip_test_widget
    url = "http://www.smartmoney.com/invest/stocks/profiting-from-stock-buybacks-1327292274324/?link=SM_hp_ls4e&2"
    @browser.get url
    wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
    element = wait.until { @browser.find_element(:class => 'termList') }
    assert element
  end
  
  def test_local_nikio
    url = "http://localhost:8000/forbes.html"
    @browser.get url
    wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
    element = wait.until { @browser.find_element(:class => 'nikio-glossary') }
    assert element
  end
  
end



require 'ci/reporter/test_unit'
require 'ci/reporter/rake/test_unit_loader'
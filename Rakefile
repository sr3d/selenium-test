selenium_executable = "./vendor/selenium-2.17.0/selenium-server-standalone-2.17.0.jar"

# Wordnik lan
# hub_register_url = "http://local.wordnik.com:4444/grid/register"

# At home
hub_register_url = "http://127.0.0.1:4444/grid/register"

# platforms are:  ANDROID, LINUX, MAC, UNIX, VISTA, WINDOWS, XP, any

task :start_server do
  cmd = "java -jar #{selenium_executable} -role hub"
  puts "Starting server with cmd:   #{cmd}"
  system cmd
end
task :server => :start_server


task :start_firefox_client do
  # java -jar selenium-server-standalone-2.14.0.jar -role node -hub http://localhost:4444/grid/register \
  #      -browser browserName=firefox,version=3.6,platform=OSX,maxInstances=4
  browser_settings = "browserName=firefox,maxInstances=5"
  cmd = "java -jar #{selenium_executable} -role node -hub #{hub_register_url} -browser #{browser_settings}"
  puts "Starting node with cmd:   #{cmd}"
  system cmd
end
task :firefox => :start_firefox_and_chrome_client


task :start_firefox_and_chrome_client do
  # java -jar selenium-server-standalone-2.14.0.jar -role node -hub http://localhost:4444/grid/register \
  #      -browser browserName=firefox,version=3.6,platform=MAC,maxInstances=4
  chrome_driver_path = File.dirname(__FILE__) + "/bin/chromedriver"
  browser_settings = [
    "browserName=firefox,platform=MAC,maxInstances=5", 
    "browserName=chrome,platform=MAC,maxInstances=5",
    "browserName=safari,platform=MAC,maxInstances=5"
  ].map{|b| "-browser \"#{b}\""}.join(" ")
  cmd = "java -jar -Dwebdriver.chrome.driver=\"#{chrome_driver_path}\" #{selenium_executable} -role node -hub #{hub_register_url} #{browser_settings}"
  puts "Starting node with cmd:   #{cmd}"
  system cmd
end


task :parallel_test do
  cmd = "bundle exec parallel_test tests/test_*.rb"

  FileUtils.rm_rf "test/reports"
  puts "Executing test with cmd: \n #{cmd}"
  system cmd
end

task :dance => :parallel_test

task :test do
  cmd = "ruby tests/test_mac_chrome.rb"
  puts "Executing test with cmd: #{cmd}"
  system cmd
end


# Rake::TestTask.new do |t|
#   t.libs << "test"
#   t.test_files = FileList['test/test*.rb']
#   t.verbose = true
# end

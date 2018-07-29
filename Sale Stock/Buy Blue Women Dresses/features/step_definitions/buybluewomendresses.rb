require 'selenium-webdriver'
driver = Selenium::WebDriver.for :chrome
driver.manage.window.maximize

Given ("I go to Homepage") do
  driver.get "http://automationpractice.com/index.php"
  driver.manage.timeouts.page_load = 300 # 5 minutes
end

Then ("I search Dresses") do
  driver.find_element(:id, "search_query_top").send_keys("dresses")
  driver.find_element(:xpath, "//*[@id='searchbox']/button").click
  driver.manage.timeouts.implicit_wait = 10 # seconds
end

Then ("I sort by the Lowest First") do
  driver.find_element(:id, 'list').click
  driver.manage.timeouts.implicit_wait = 10 # seconds
  driver.find_element(:id, 'selectProductSort').find_element(:css,'#selectProductSort > option:nth-child(2)').click
  driver.manage.timeouts.implicit_wait = 10 # seconds
end

And ("I buy blue dress") do
  driver.find_element(:xpath, "//*[@id='color_2']").click
  driver.manage.timeouts.implicit_wait = 10 # seconds
  driver.find_element(:xpath, "//*[@id='add_to_cart']/button").click
  driver.manage.timeouts.implicit_wait = 10 # seconds
  sleep(4)
  driver.find_element(:xpath, "//*[@id='layer_cart']/div[1]/div[2]/div[4]/a/span").click
  driver.manage.timeouts.implicit_wait = 10 # seconds
  sleep(4)
  driver.find_element(:xpath, "//*[@id='center_column']/p[2]/a[1]/span/i").click
  driver.manage.timeouts.implicit_wait = 10 # seconds
  driver.find_element(:id, "email").send_keys"tester5@email.com"
  driver.find_element(:id, "passwd").send_keys"123456"
  driver.find_element(:id, "SubmitLogin").click
  driver.manage.timeouts.implicit_wait = 10 # seconds
  driver.find_element(:xpath, "//*[@id='ordermsg']/textarea").send_keys"send it as fast as you can boy"
  driver.find_element(:xpath, "//*[@id='center_column']/form/p/button/span/i").click
  driver.manage.timeouts.implicit_wait = 10 # seconds
  driver.find_element(:id, "cgv").click
  driver.find_element(:xpath, "//*[@id='form']/p/button/span/i").click
  driver.manage.timeouts.implicit_wait = 10 # seconds
  sleep(4)
  driver.find_element(:xpath, "//*[@id='HOOK_PAYMENT']/div[1]/div/p/a").click
  driver.manage.timeouts.implicit_wait = 10 # seconds
  driver.find_element(:xpath, "//*[@id='cart_navigation']/button").click
  driver.manage.timeouts.implicit_wait = 10 # seconds
  sleep(5)
end

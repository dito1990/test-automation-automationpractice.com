require 'selenium-webdriver'
driver = Selenium::WebDriver.for :chrome
driver.manage.window.maximize

Given ("I go to Homepage") do
  driver.get "http://automationpractice.com/index.php"
  driver.manage.timeouts.page_load = 600 # 5 minutes
end

Then ("click Discount banner") do
  driver.find_element(:xpath, "//*[@id='htmlcontent_top']/ul/li[1]/a/img").click
  driver.manage.timeouts.implicit_wait = 10 # seconds
  driver.page_source(:xpath, "//*[@id='header']/div[1]/div/div/a/img").click
  driver.manage.timeouts.implicit_wait = 10 # seconds
  sleep (5)
end

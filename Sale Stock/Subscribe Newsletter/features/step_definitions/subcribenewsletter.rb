require 'selenium-webdriver'
driver = Selenium::WebDriver.for :chrome
driver.manage.window.maximize

Given ("I go to Homepage") do
  driver.get "http://automationpractice.com/index.php"
  driver.manage.timeouts.page_load = 600 # 5 minutes
end

Then ("type valid email address") do
  driver.find_element(:xpath, "//*[@id='newsletter-input']").send_keys"rtyuiop@gmail.com",:enter
  driver.manage.timeouts.implicit_wait = 10 # seconds
  driver.find_element(:xpath, "//*[@id='columns']/p").text.include?(" Newsletter : You have successfully subscribed to this newsletter.")
end

Then ("type invalid email address") do
  driver.find_element(:xpath, "//*[@id='newsletter-input']").send_keys"qwerty",:enter
  driver.manage.timeouts.implicit_wait = 10 # seconds
  driver.find_element(:xpath, "//*[@id='columns']/p").text.include?(" Newsletter : Invalid email address.")
end

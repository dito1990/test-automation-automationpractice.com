require 'selenium-webdriver'
driver = Selenium::WebDriver.for :chrome
driver.manage.window.maximize

Given ("I go to Homepage") do
  driver.get "http://automationpractice.com/index.php"
  driver.manage.timeouts.page_load = 600 # 5 minutes
end

Then ("click arrows button") do
  driver.find_element(:class, "bx-next").click
  sleep (1)
  driver.find_element(:class, "bx-next").click
  sleep (1)
  driver.find_element(:class, "bx-next").click
  sleep (1)
  driver.find_element(:class, "bx-prev").click
  sleep (3)
end

Then ("click shop button") do
  driver.find_element(:xpath, "//*[@id='homeslider']/li[4]/div/p[2]/button").click
  sleep (3)
end

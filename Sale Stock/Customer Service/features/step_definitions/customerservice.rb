require 'selenium-webdriver'
driver = Selenium::WebDriver.for :chrome
driver.manage.window.maximize

Given ("I go to Homepage") do
  driver.get "http://automationpractice.com/index.php"
  driver.manage.timeouts.page_load = 300 # 5 minutes
end

Then ("I click Contact Us button") do
  driver.find_element(:id, "contact-link").click
  driver.manage.timeouts.implicit_wait = 10 # seconds
end

Then ("I send a message to Customer Service") do
  driver.find_element(:id, "id_contact").find_element(:css,'#id_contact > option:nth-child(2)').click
  driver.manage.timeouts.implicit_wait = 10 # seconds
  driver.find_element(:id, "email").send_keys"usertesting@email.com"
  driver.find_element(:id, "id_order").send_keys"1234test"
  driver.find_element(:id, "message").send_keys"testing send a message to customer service"
  driver.manage.timeouts.implicit_wait = 10 # seconds
  sleep(3)
  driver.find_element(:id, "submitMessage").click
  driver.manage.timeouts.implicit_wait = 10 # seconds
  driver.find_element(:xpath, "//*[@id='center_column']/p").text.include?("Your message has been successfully sent to our team.")
  driver.manage.timeouts.implicit_wait = 10 # seconds
  sleep(5)
end

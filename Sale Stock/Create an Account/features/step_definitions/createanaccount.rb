require 'selenium-webdriver'
driver = Selenium::WebDriver.for :chrome
driver.manage.window.maximize

Given ("I go to Homepage") do
  driver.get "http://automationpractice.com/index.php"
  driver.manage.timeouts.page_load = 600 # 5 minutes
end

Then ("click Sign In button") do
  driver.find_element(:class, "login").click
  driver.manage.timeouts.implicit_wait = 10 # seconds
end

Then ("type email address") do
  driver.find_element(:xpath, "//*[@id='email_create']").send_keys"tester5@email.com",:enter
  driver.manage.timeouts.implicit_wait = 10 # seconds
end

Then ("fill the personal information") do
  driver.find_element(:xpath, "//*[@id='id_gender1']").click
  driver.find_element(:id, "customer_firstname").send_keys"Dito"
  driver.find_element(:id, "customer_lastname").send_keys"Onlytest"
  driver.find_element(:id, "passwd").send_keys"123456"
  driver.find_element(:id, 'days').find_element(:css,'#days > option:nth-child(9)').click
  driver.manage.timeouts.implicit_wait = 10 # seconds
  driver.find_element(:id, 'months').find_element(:css,'#months > option:nth-child(11)').click
  driver.manage.timeouts.implicit_wait = 10 # seconds
  driver.find_element(:id, 'years').find_element(:css,'#years > option:nth-child(30)').click
  driver.manage.timeouts.implicit_wait = 10 # seconds
  driver.find_element(:id, "company").send_keys"majumundur"
  driver.find_element(:id, "address1").send_keys"jogja"
  driver.find_element(:id, "address2").send_keys"sleman"
  driver.find_element(:id, "city").send_keys"indonesia"
  driver.find_element(:id, 'id_state').find_element(:css,'#id_state > option:nth-child(2)').click
  driver.manage.timeouts.implicit_wait = 10 # seconds
  driver.find_element(:id, "postcode").send_keys"34567"
  driver.find_element(:id, 'id_country').find_element(:css,'#id_country > option:nth-child(2)').click
  driver.manage.timeouts.implicit_wait = 10 # seconds
  driver.find_element(:id, "other").send_keys"testing"
  driver.find_element(:id, "phone").send_keys"62123456"
  driver.find_element(:id, "phone_mobile").send_keys"62123456789"
  sleep (5)
end

Then ("click Register button") do
  driver.find_element(:id, "submitAccount").click
  sleep (10)
end

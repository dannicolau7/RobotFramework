*** Settings ***


Library     SeleniumLibrary


*** Variables ***
${username}             dan.nicolau_ex@kdrp.com
${invalid_password}     123445
${valid_password}       D@nn2604
${url}                  https://www.keurig.com/

*** Keywords ***
open the browser with Keurig url
    Create Webdriver    Chrome  executable_path=C:\\Users\\danicola\\PycharmProjects\\pythonProject2\\chromedriver.exe
    Go To   ${url}

Close Browser session
    Close Browser
*** Settings ***
Documentation   To validate the login form
Library     SeleniumLibrary
Library    Telnet
Test Teardown    Close Browser

*** Variables ***
${Error_Message_Login}       css:.css-gjfxul

*** Test Cases ***
Validate Succesful Login
    open the browser with Keurig url
    wait until the coupon SignUpCoupon show
    Fill up the coupon SignUpCoupon
    close the Thank You SignUpCoupon
    Click Account
    Fill the login Form
    wait until it checks and display error message
    verify error message is correct

*** Keywords ***
open the browser with Keurig url
    Create Webdriver    Chrome  executable_path=C:\\Users\\danicola\\PycharmProjects\\pythonProject2\\chromedriver.exe
    Go To   https://www.keurig.com/

wait until the coupon SignUpCoupon show
    Wait Until Element Is Visible    id:_tealiumModalBody   7

Fill up the coupon SignUpCoupon
    Input Text    class:emailSignup   dan@malinator.com
    Click Button     id:popup_signupbutton

close the Thank You SignUpCoupon
    Click Element    id:_tealiumModalClose

Click Account
    Click Element    class:login

Fill the login Form
    Input Text    css:.floating-input   dan.nicolau_ex@kdrp.com
    Input Password    id:L_Password    D@nn2604
    Click Button    //button[contains(text(),'SIGN IN')]

wait until it checks and display error message
    Wait Until Element Is Visible   ${Error_Message_Login}

verify error message is correct
    ${result}=  Get Text   ${Error_Message_Login}
    Should Be Equal As Strings      ${result}        Your username or password was incorrect.
    Element Text Should Be      ${Error_Message_Login}      Your username or password was incorrect.

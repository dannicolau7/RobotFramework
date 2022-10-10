*** Settings ***
Documentation   To validate the login form
Library     SeleniumLibrary
Test Setup      open the browser with Keurig url
Test Teardown    Close Browser session
Resource        resource.robot

*** Variables ***
${Error_Message_Login}       css:.css-gjfxul
${Coupon_Wait}               css:.emailSignup
${Succesful_Login}           css:.floating-input
*** Test Cases ***
Validate Coupon Signup
    wait until the coupon SignUpCoupon show
    Fill up the coupon SignUpCoupon
    close the Thank You SignUpCoupon

Validate Succesful Login
    Click Account
    Wait Until Element Is located in the page       ${Succesful_Login}
    Fill the login Form      ${username}      ${valid_password}
    Wait Until Element Is located in the page      ${Error_Message_Login}
    verify error message is correct

Validate Coffee Makers List
    wait until the coupon SignUpCoupon show
    close the Thank You SignUpCoupon
    Select the Coffee Makers button
    Verify New Shop Coffee makers
*** Keywords ***

Fill up the coupon SignUpCoupon
    Input Text       ${Coupon_Wait}    ${username}
    Click Button     id:popup_signupbutton

close the Thank You SignUpCoupon
    Click Element    id:_tealiumModalClose

Click Account
    Click Element    class:login

wait until the coupon SignUpCoupon show
    Wait Until Element Is Visible    ${Coupon_Wait}   7

Wait Until Element Is located in the page
    [Arguments]     ${element}
    Wait Until Element Is Visible   ${element}

Fill the login Form
    [Arguments]       ${username}               ${valid_password}
    Input Text        ${Succesful_Login}        ${username}
    Input Password    id:L_Password             ${valid_password}
    Click Button      //button[contains(text(),'SIGN IN')]

verify error message is correct
    ${result}=  Get Text            ${Error_Message_Login}
    Should Be Equal As Strings      ${result}                   Your username or password was incorrect.
    Element Text Should Be          ${Error_Message_Login}      Your username or password was incorrect.

Select the Coffee Makers button
    Click Element       css:.oz-linkWrapper

Verify New Shop Coffee makers
   Create List     K-Café® SMART Single Serve Coffee Maker   K-Supreme Plus® SMART Single Serve Coffee Maker     K-Supreme® SMART Single Serve Coffee Maker
   Get WebElements      css:.brew-name

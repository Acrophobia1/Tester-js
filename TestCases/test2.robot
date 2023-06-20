*** Settings ***
Library  SeleniumLibrary
*** Test Cases ***
TC1:
    open browser  https://www.saucedemo.com/    chrome
    maximize browser window

    ${elem}     get webelement  id=user-name
    input text      ${elem}  standard_user
    input password  id: password    secret_sauce
    click button  id:login-button
    ${text}     get text  class=title
    log to console  ${text}
#    click link      logout
    sleep   4
    close browser
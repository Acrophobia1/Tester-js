*** Settings ***
Library  SeleniumLibrary
*** Test Cases ***
TC1:
    open browser  http://the-internet.herokuapp.com/login    chrome
    maximize browser window

    ${elem}     get webelement  id=username
    input text  ${elem}  tomsmith
    input password  id: password    SuperSecretPassword!
    click button  class:radius
    ${text}     get text  id=flash
    log to console  ${text}
    click link      Logout
    sleep   4
    close browser
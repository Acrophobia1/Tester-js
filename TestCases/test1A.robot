*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${ur}           http://the-internet.herokuapp.com/login
${browser}      chrome
${usr}          tomsmith
${password}     SuperSecretPassword!
@{login}    tomsmith    SuperSecretPassword!
*** Test Cases ***
Demo Basic Element Locator
    open browser    ${ur}    ${browser}
    maximize browser window
    input text  id:username    ${login}[0]
    input text  name:password    ${login}[1]
    click button  class:radius
    ${text}     get text  id:flash
    log     ${text}
    click element     link: Logout
    sleep   4
    close browser
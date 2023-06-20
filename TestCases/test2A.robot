*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${ur}           https://www.saucedemo.com/
${browser}      chrome
${usr}          standard_user
${password}     secret_sauce
@{login}    standard_user   secret_sauce
*** Test Cases ***
Demo Basic Element Locator
    open browser    ${ur}   ${browser}
    maximize browser window
    input text      id:user-name    ${login}[0]
    input text  name:password     ${login}[1]
    click button  id:login-button
    ${text}     get text    class:title
    log     ${text}
    sleep   4
    close browser
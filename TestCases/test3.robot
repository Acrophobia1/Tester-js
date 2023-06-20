*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${url}           http://the-internet.herokuapp.com/login
${browser}       chrome
#${usr}          tomsmith
#${password}     SuperSecretPassword!
&{login}    usr=tomsmith    pwd=SuperSecretPassword!
*** Test Cases ***
Demo Basic Element Locator
    open browser  ${url}    ${browser}
    maximize browser window
    input text  //*[@id='username']    ${login}[usr]
    input text  //*[@name='password']    ${login}[pwd]
    click button  //*[@class='radius']
    ${text}     get text  //*[@id='flash']
    log to console     ${text}
    click element     //i[contains(text(),'Logout')]
    sleep   4
    close browser
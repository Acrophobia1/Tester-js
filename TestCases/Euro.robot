*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${url}          https://currency.me.uk/convert/usd/thb
${browser}      chrome
${pattern}
*** Test Cases ***
TC1
        open browser  ${url}    ${browser}
        maximize browser window
        click link  //a[contains(text(),'Euro')]
        input text  //input[@id='amount']   123
        ${value}    get element attribute   css:#answer    value
        log to console  ${value}
        ${USD}     get text    //div[@id='tofrom2a']/span[2]
        log to console  ${USD}
        ${Euro}     get text    //div[@id='tofrom4a']/span[2]
        log to console  ${Euro}
        should be equal  119.2   ${value}


        sleep  4
        close browser





*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${url}          https://the-internet.herokuapp.com/javascript_alerts
${browser}      chrome
*** Test Cases ***
TC1
        open browser  ${url}    ${browser}
        maximize browser window
        sleep  2
        click button    //button[contains(text(),'Click for JS Alert')]
        sleep  2
        ${text1}     handle alert    accept
        ${confirm1}     get text    //p[@id='result']
        log to console      ${text1}
        log to console      ${confirm1}
        sleep  4

        click button    //button[contains(text(),'Click for JS Confirm')]
        sleep  2
        ${text2}     handle alert    accept
        ${confirm2}     get text    //p[@id='result']
        log to console      ${text2}
        log to console      ${confirm2}
        sleep  4

        click button    //button[contains(text(),'Click for JS Prompt')]
        sleep  2
        ${text3}     input text into alert      Oatto
        ${confirm3}     get text    //p[@id='result']
        log to console      ${text3}
        log to console      ${confirm3}
        sleep  4
        close browser
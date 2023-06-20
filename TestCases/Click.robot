*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${url}          https://swisnl.github.io/jQuery-contextMenu/demo.html
${browser}      chrome

*** Test Cases ***
TC1
        open browser  ${url}    ${browser}
        maximize browser window
        open context menu   //span[contains(text(),'right click me')]
        wait until element is visible  css:li[class*='copy']
        click element        css:li[class*='copy']
        sleep  2
        ${text1}     handle alert    accept
        log to console      ${text1}
        should contain      ${text1}        copy
        sleep  3
        close browser


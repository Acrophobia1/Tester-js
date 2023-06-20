*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${url}          https://www.ebay.com
${browser}      chrome
${Prod}         Samsung Galaxy S20 SM-G981U - 128GB All Colors (Unlocked) Good Light Shadow
*** Test Cases ***
TCShould assertion
        open browser  ${url}    ${browser}
        maximize browser window
        input text      css:#gh-ac     ${Prod}
        click element  css:#gh-btn
        ${Value}    get text    //h1[@class='srp-controls__count-heading']/span[1]
        log to console  ${Value}
        should be equal  ${Value}  2
        sleep   2
        close browser

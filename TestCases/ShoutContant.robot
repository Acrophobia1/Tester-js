*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${url}          https://www.unitconverters.net/temperature/fahrenheit-to-celsius.htm
${browser}      chrome
${ftemp}        90
*** Test Cases ***
TCShould assertion
        open browser  ${url}    ${browser}
        maximize browser window
        input text      css:#ucfrom     ${ftemp}
        ${ctemp}    get element attribute       css:#ucto    value
        log to console  ctemp = ${ctemp}
        ${result}   evaluate    (${ftemp} - 32) *5/9
        log to console  ${result}
        should be equal as numbers  ${result}   ${ctemp}
        sleep   4
        close browser

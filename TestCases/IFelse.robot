*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${url}          https://www.telerik.com/support/demos
${browser}      chrome
${accept}       //button[@id='onetrust-accept-btn-handler']
                same #css:#onetrust-accept-btn-handler
*** Test Cases ***
TC1
        open browser  ${url}    ${browser}
        maximize browser window










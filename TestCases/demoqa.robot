*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${url}          https://demoqa.com/modal-dialogs
${browser}      chrome
${accept}       //button[@id='closeSmallModal']
*** Test Cases ***
TC1
        open browser  ${url}    ${browser}
        maximize browser window
        click button  //button[@id='showSmallModal']
        wait until element is visible       //div[@id='example-modal-sizes-title-sm']
        sleep  4
        ${status}   run keyword and return status       page should contain element     ${accept}
        run keyword if      ${status}       click element       ${accept}
        close browser





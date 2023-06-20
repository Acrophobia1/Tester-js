*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${url}          https://qavbox.github.io/demo/webtable/
${browser}      chrome
${Search}       Selenium
${Table}        //table[@id='table01']//tbody

*** Test Cases ***
TC1
        open browser  ${url}    ${browser}
        maximize browser window
        ${row}      get element count       ${Table}/tr
        log to console      row=${row}
            FOR     ${i}    IN RANGE    1   ${row}+1
                    ${elem}     get webelement      ${Table}/tr[${i}]
                    ${text}     get text    ${elem}
                    log to console      ${text}
                    ${found}    run keyword and return status
                    ...     table row should contain        ${Table}        ${i}        ${Search}
                    run keyword if      ${found}        run keywords
                    ...                 click element       ${Table}/tr[${i}]/td[1]
                    ...     AND         click element       ${Table}/tr[${i}]/td[5]
                    exit for loop if    ${found}
            END
        run keyword and continue on failure         should be true      ${found}        msg= ${search} not fount
        sleep  3
        close browser








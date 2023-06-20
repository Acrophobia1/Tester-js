*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${url}              https://www.yahoo.com/?guccounter=1
${browser}          chrome
${searchText}       robot framework keywords
*** Test Cases ***
TC
    open browser  ${url}    ${browser}
    maximize browser window
    input text      //input[@id='ybar-sbq']     robot framework
    wait until element is visible   //ul[@role='listbox']/li
    @{element}      get webelements     //ul[@role='listbox']/li
    FOR     ${elem}   IN   @{element}
            ${text}     get text    ${elem}
            log to console      ${text}
            ${found}    set variable if     '${text}'=='${searchText}'      ${True}     ${False}
            log to console      ${found}
            exit for loop if    ${found}
    END
    run keyword if      ${found}        click element   ${elem}
    run keyword and continue on failure         should be true      ${found}        msg= ${searchText} not fount
    sleep   4
    close browser



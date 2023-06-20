*** Settings ***
Library     Selenium2Library
Library     ExcelLibrary


*** Variables ***
${url}          https://www.calculator.net/gas-mileage-calculator.html
${browser}      Chrome
${datatable}    TestData/Gasdata.xlsx

*** Test Cases ***
Test Excel
    Open Browser  ${url}  ${browser}
    Maximize Browser Window
    open excel document     ${datatable}       Sheet1
    ${row}      set variable        4
    FOR     ${i}    IN RANGE    2      ${row}+1
        ${Current}          read excel cell     ${i}    1
        input text      //input[@id='mucodreading']     ${Current}
        ${Previous}         read excel cell     ${i}    2
        input text      //input[@id='mupodreading']     ${Previous}
        ${Added}            read excel cell     ${i}    3
        input text      //input[@id='mugasputin']       ${Added}
        ${Price}            read excel cell     ${i}    4
        input text      //input[@id='mugasprice']       ${Price}
        ${ele}      get webelement       //input[@alt='Calculate']
        execute javascript      arguments[0].click();      ARGUMENTS       ${ele}
        wait until element is visible       //div[@id='content']//p/font/b
        ${text}     get text        //div[@id='content']//p/font/b
        log to console      ${text}
        ${result}            read excel cell     ${i}    5
        log to console      ${result}
        ${passed}   run keyword and return status   should contain      ${text}     ${result}
        log to console      ${passed}
        run keyword if      '${passed}'=='True'     write excel cell    ${i}    6   Pass
        ...     ELSE        write excel cell    ${i}    6   Fail
    END
    sleep  3
    save excel document         ${datatable}
    close all excel documents
    close browser
    
*** Settings ***
Library     Selenium2Library
*** Variables ***
${url}              https://the-internet.herokuapp.com/
${browser}          chrome
${Picture}          ${CURDIR}/Profile.jpg
*** Test Cases ***
File Upload
    Open Browser        ${url}      ${browser} 
    Maximize Browser Window
    Click Element       //a[contains(text(),'File Upload')]
    choose file         //input[@id='file-upload']           ${Picture}
    Click Element       //input[@id='file-submit']
    Wait Until Element Is Visible       //div[@id='uploaded-files']
    ${textPicture}      get text        //div[@id='uploaded-files']
    should be equal     ${textPicture}      Profile.jpg
    log to console      ${textPicture}
    Sleep   2

Multiple Windows
    Open Browser        ${url}      ${browser} 
    Maximize Browser Window
    scroll element into view        //a[contains(text(),'Multiple Windows')]
    Click Element       //a[contains(text(),'Multiple Windows')]
    Click Element       //a[contains(text(),'Click Here')]
    Sleep   3
    Switch Window     title=New Window
    ${New window}      get text        //h3[contains(text(),'New Window')]
    should be equal     ${New window}      New Window
    log to console      ${New window} 

Sortable Data Tables
    Open Browser        ${url}      ${browser} 
    Maximize Browser Window
    scroll element into view        //a[contains(text(),'Sortable Data Tables')]
    Click Element       //a[contains(text(),'Sortable Data Tables')]     
    ${Columns}=     get element count  //table[@id='table1']/tbody/tr[1]/td   
    ${Rows}=        get element count    //table[@id='table1']/tbody/tr
    Log To Console      ${Columns}
    Log To Console      ${Rows}
    ${data}=        get text     //table[@id='table1']/tbody/tr[2]/td[5]        
    Log To Console      ${data}   
    table header should contain     //table[@id='table1']       Action
    table row should contain        //table[@id='table1']       3       $100.00
    Table Column Should Contain     //table[@id='table1']       1       Smith
    Close All Browsers
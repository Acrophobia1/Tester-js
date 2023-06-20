*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${url}          https://demos.telerik.com/kendo-ui/dragdrop/index
${browser}      chrome
${accept}       //button[@id='onetrust-accept-btn-handler']
*** Test Cases ***
TC1
        open browser  ${url}    ${browser}
        maximize browser window
        ${status}   run keyword and return status       page should contain element     ${accept}
        run keyword if      ${status}       click element       ${accept}
        sleep  3
        drag and drop   //div[@id='draggable']      //div[@id='droptarget']
        sleep  3
#        wait until element is visible       //div[@class='k-header painted']
#        mouse down      //div[@id='draggable']
#        sleep  3
#        mouse over      //div[@id='droptarget']
#        sleep  3
#        mouse up        //div[@id='droptarget']
        ${text}     get text  //div[@id='droptarget']
        log to console      ${text}
        should be equal     ${text}     You did great!
        sleep  3
        close browser


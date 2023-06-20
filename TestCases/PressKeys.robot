*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${url}          https://th.indeed.com/
${browser}      chrome
*** Test Cases ***
TC1
        open browser  ${url}    ${browser}
        maximize browser window
        input text  //input[@id='text-input-what']      Software Tester
        sleep   2
        press keys  //input[@id='text-input-what']       CTRL+A+DELETE
        sleep   2
        input text  //input[@id='text-input-what']      Robot Framework
        input text  //input[@id='text-input-where']     Bangkok
        click button  //button[contains(text(),'Find jobs')]
#       press keys  //button[contains(text(),'Find jobs')]      ENTER
        wait until element is visible       //div[@class='jobsearch-JobCountAndSortPane-jobCount']
        ${text}     get text    //div[@class='jobsearch-JobCountAndSortPane-jobCount']
        ${count}    should match regexp     ${text}         \\d{2,}
        log to console  ${count}
        should contain  ${count}     71
        close browser


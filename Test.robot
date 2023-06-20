*** Settings ***
Library     Selenium2Library
*** Variables ***
${url}              https://demoqa.com/
${browser}          chrome
${firstname}        Supakit
${lastname}         Jatuten
${email}            supakit_j@outlook.com
${gender}           //label[contains(text(),'Male')]
${number}           0984944415
${month}            January
${year}             1997
${day}              //div[@class='react-datepicker__day react-datepicker__day--031']
${Subjects}         Arts
${Hobbies}          //label[contains(text(),'Sports')]
${Picture}          ${CURDIR}/Profile.jpg
${Address}          26 T.Donkaew A.Maerim ChiangMai 50180
${State}            NCR
${City}             Delhi
${Tableresult}      //table[@class="table table-dark table-striped table-bordered table-hover"]/tbody

*** Test Cases ***
DEMOQA
        open browser    ${url}      ${browser}
        maximize browser window
        scroll element into view        //h5[text()='Book Store Application']
        click element       //h5[text()='Forms']
        click element       //span[text()='Practice Form']
        input text          css:input#firstName             ${firstname}
        input text          //input[@id='lastName']         ${lastname}
        input text          //input[@id='userEmail']        ${email}
        click element       ${gender}
        input text          //input[@id='userNumber']       ${number}
        click element       //input[@id='dateOfBirthInput']
        select from list by label       //select[@class='react-datepicker__month-select']       ${month}
        select from list by value       //select[@class='react-datepicker__year-select']        ${year}
        click element       ${day}
        scroll element into view    //textarea[@id='currentAddress']
        input text          //input[@id='subjectsInput']            ${Subjects}
        sleep   1
        press keys          //input[@id='subjectsInput']        ENTER
        click element       ${Hobbies}
        choose file         //input[@id='uploadPicture']            ${Picture}
        input text          //textarea[@id='currentAddress']        ${Address}
        Execute javascript  document.body.style.zoom="65%"
        sleep   1
        input text          css:input#react-select-3-input              ${State}
        sleep   1
        press key          css:input#react-select-3-input              \ue007
        sleep   1
        input text          //input[@id='react-select-4-input']         ${City}
        sleep   1
        press key          //input[@id='react-select-4-input']         \ue007
        ${ele}    Get WebElement    //button[@id='submit']
        Execute Javascript    arguments[0].click();     ARGUMENTS    ${ele}
        wait until element is visible       //div[@class='modal-content']
                                                    #//td[text()='supakit_j@outlook.com']
        ${textname}                 get text        ${Tableresult}/tr[1]/td[2]
        ${textemail}                get text        ${Tableresult}/tr[2]/td[2]
        ${textgender}               get text        ${Tableresult}/tr[3]/td[2]
        ${textnumber}               get text        ${Tableresult}/tr[4]/td[2]
        ${textDate of Birth}        get text        ${Tableresult}/tr[5]/td[2]
        ${textSubjects}             get text        ${Tableresult}/tr[6]/td[2]
        ${textHobbies}              get text        ${Tableresult}/tr[7]/td[2]
        ${textPicture}              get text        ${Tableresult}/tr[8]/td[2]
        ${textAddress}              get text        ${Tableresult}/tr[9]/td[2]
        ${textState and City}       get text        ${Tableresult}/tr[10]/td[2]
        should be equal     ${textname}                 ${firstname} ${lastname}
        should be equal     ${textemail}                ${email}
        should be equal     ${textgender}               Male
        should be equal     ${textnumber}               ${number}
        should be equal     ${textDate of Birth}        31 ${month},${year}
        should be equal     ${textSubjects}             ${Subjects}
        should be equal     ${textHobbies}              Sports
        should be equal     ${textPicture}              Profile.jpg
        should be equal     ${textAddress}              ${Address}
        should be equal     ${textState and City}       ${State} ${City}
        log to console      ${textname}
        log to console      ${textemail}
        log to console      ${textgender}
        log to console      ${textnumber}
        log to console      ${textDate of Birth}
        log to console      ${textSubjects}
        log to console      ${textHobbies}
        log to console      ${textPicture}
        log to console      ${textAddress}
        log to console      ${textState and City}
        sleep   1
        close browser

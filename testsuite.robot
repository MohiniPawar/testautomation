*** Settings ***
Test Setup        Test Setup123
Test Teardown     #Close All Browsers
Library           SeleniumLibrary
Library           Collections
Library           RequestsLibrary

*** Variables ***
@{page_texts}     SeleniumLibrary    Introduction    Keyword documentation    Installation    Browser drivers    Usage
${texts_all}      Introduction

*** Test Cases ***
test2
    Page Should Contain    SeleniumLibrary
    :FOR    ${text}    IN    @{page_texts}
    \    Page Should Contain    ${text}
    :FOR    ${text}    IN    ${texts_all}
    \    Page Should Contain    ${text}

collections
    ${list123}=    Create List    a    b    c
    :FOR    ${VAR}    IN    @{list123}
    \    Log    ${VAR}

API
    Create Session    google    http://www.google.com
    ${resp}=    Get Request    google    /
    Should Be Equal As Strings    ${resp.status_code}    200

*** Keywords ***
Test Setup123
    Comment    Create Webdriver    Firefox
    Comment    Go to    http://robotframework.org/SeleniumLibrary/

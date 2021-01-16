*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${url}  https://www.flipkart.com/
${browser}  chrome
${Category_Type} =  HP U1 32 GB MicroSDXC Class 10 100 MB/s Memory Card
${Expected_product_Name} =  HP U1 32 GB MicroSDXC Class 10 100 MB/s Memor...
*** Test Cases ***
Flipkart
    open browser    ${url}  ${browser}
    maximize browser window
    Login to Flipkart
    View Cart
    Shop Now
    Select Electronics
    Select memory card
    Select item
    Add to cart


*** Keywords ***

Login to Flipkart
    input text  xpath://input[@class='_2IX_2- VJZDxU']  9495125340
    input text  xpath://input[contains(@class,'_2IX_2- _3mctLh')]   flip123
    click element   xpath:(//span[text()='Login'])[2]
View Cart
    sleep   2
    click element   xpath://span[text()='Cart']
    sleep   2
Shop Now
    click element   xpath://span[text()='Shop now']
    sleep   2
Select Electronics
    click element   xpath://div[@class='_1kidPb']//span
    sleep   2
Select memory card
    click element   xpath://a[@class='_3QN6WI'][text()='Memory Cards']
    sleep   2
Select item

    ${MemoryCard_details} =  Get Element Count  xpath=//div[@class='E2-pcE _1q8tSL']/div
    sleep  3s
    FOR  ${i}  IN RANGE  2  ${MemoryCard_details}
    ${Card_Name} =  Get Text  xpath=//div[@class='E2-pcE _1q8tSL']/div[2]/div/div[${i}]/div/a[2]
    Exit For Loop If  "${Card_Name}" == "${Category_Type}"
    END
    Set Test Variable  ${Card_Name_Static}  xpath=//div[@class='E2-pcE _1q8tSL']/div[2]/div/div[${i}]/div/a[2]
    Click Element  ${Card_Name_Static}
    select window   NEW

Add to cart
    Click Element   xpath://button[@class='_2KpZ6l _2U9uOA _3v1-ww']

Verify Product
    sleep  2s
    Verify WebPage title  ${Expected_product_Name}

Verify WebPage title
    [Arguments]  ${title_name}
    Wait Until Page Contains  ${title_name}
    Log to Console  ${title_name}
    Log to Console  Pass!!




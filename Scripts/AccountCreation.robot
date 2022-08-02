*** Settings ***
Library    SeleniumLibrary 
Library    String  
Library    ExcelLibrary      
Resource    ../Resources/AccountCreationKeywords.robot   

*** Variables ***
${NumberOfEmailsToBeCreated}    20


*** Test Cases ***

Create Unlimited Accounts
    Create User Define Number Of Accounts    ${NumberOfEmailsToBeCreated}
    

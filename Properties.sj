﻿
//work station properties
var TEST_DATA = true;

//Workstation IP/URL. Values will be reading from \WorkstationData\DDT\Config\AppConfig.xlsm
var SERVER_IP = "";
//To store application hoem URL
var APP_NAME = "";
var STATION = "";
var APP_HOME = "";
var BROWSER = btFirefox;
var URL= "https://www.monsterindia.com";
var BrowserInfo = "";
var db = "MySQL";
var Description = "";
var TestReporting = "";
var UID ="";


//timeout (unit: milliseconds)
var TIME_OUT_FOR_FINDING_OBJECT = 10000;     
var TIME_OUT_FOR_LOADING_DIALOG = 10000;

//debug
var DEBUG_DEVELOPER = true;
var DEBUG_LOWBANDWIDTH = false;
var caseInsensitive = true;

//Other global variables
var RETRYCOUNT = 1;

//-----Application default users---
//Built in Admin
var ADMIN_ID = "admin"
var ADMIN_PASSWORD = "admin"
var INVALID_USER ="service1";
var INVALID_PASSWORD="service1";
var SERVICE_USERID ="service";
var SERVICE_PASSWORD ="service";
var OPERATOR_USERID = "operator";


//Service user
var SERVICE_ID = "admin";
var SERVICE_PASSWORD = "admin";

//Operator Admin user
var OPERATOR_ID = "Pathologist1";
var OPERATOR_PASSWORD = "admin";

//Create user details
var USER_FIRSTNAME = "Firstname";
var USER_LASTNAME = "Lastname";
var USER_NAME ="User";
var FIRSTTIME_USER="FirsttimeUser";
var PASSWORD ="Testing@123!!";
var RE_PASSWORD ="Testing@123!!";
var NEW_PASSWORD="Password@123#";
var NEW_CONFIRMPWD ="Password@123#";
var SECURITY_QUESTION="Question";
var SECURITY_ANSWER = "Answer";
var INVALID_ANSWER = "Ans";
var EMAIL = "abc@roche.com";
var WRONG_PASSWORD="Test";
var ADMIN_ROLE = "Administrators";
var SERVICE_ROLE = "Service";
var OPERATOR_ROLE = "Operators";
var FORGOT_NEW_PASSWORD="Password@123!!";
var FORGOT_NEW_CONFIRMPWD ="Password@123!!";
//Create TissueType
var TISSUE_NAME = "Lung";
var TISSUE_DES = "Des";
var TISSUE_EDIT = "Modify";
//Create DownStreamApplication
var DOWNSTREAM_NAME ="DemoDownStream";
var DOWNSTREAM_DES = "Des";
var DOWNSTREAM_EDIT = "Modify";
var TARGET_VOLUME = "200";
var TARGET_EDIT = "Modify";

//Case details
var caseID = "UID";
var patientName = "John";
var MODIFY_PAT = "Modify";
var patientID = "ID";
var MALE_GEN = "Male";
var FEMALE_GEN ="Female";
var SELECT_STAGE = "From Stage";
var SELECT_FILE = "From File";
var PENDING_CASE = "PendingCase";
var OPEN_CASE ="OpenCase";
var COMPLETED_CASE = "CompletedCase";




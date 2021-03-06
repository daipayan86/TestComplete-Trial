﻿//USEUNIT _begin
//USEUNIT _end
//USEUNIT AmazonCommonFuncs
//USEUNIT CommonFuncs
//USEUNIT CommonVars
//USEUNIT DbConn
//USEUNIT HTMLReporting
//USEUNIT Library
//USEUNIT Properties
//USEUNIT ReportCommonFuncs
//USEUNIT Repository
//USEUNIT SysAdminCommonFuncs
//USEUNIT Unexpected_Window
/************************************************************************************
Test Steps:
===========
Step1 'Login with the following:
Username : InvalidUser
Password : Password@
Click on the LOGIN button
Result: 'It displays error message saying "Username or Password is invalid. Please retry again."

Step2 Verify the text boxes and the Login button
Result: The text boxes have a red border and the Login button is  disabled.
"Forgot Password" link  remain available.

Created By : Janardhana        
***********************************************************************************/
function UID2367() {
    Properties.TC = "UID2367_Login_as_Invalid_UN___Invalid_PW";
    CommonFuncs.Begin_test();
    AmazonCommonFuncs.CloseApplicaton(Properties.APP_NAME);
    AmazonCommonFuncs.LoadApplication(Properties.APP_NAME)

    //Step1 'Login with the following:
    //Username : InvalidUser
    //Password : Password@
    //Click on the LOGIN button
    //Result: 'It displays error message saying "Username or Password is invalid. Please retry again."
    if (AmazonCommonFuncs.invalidloginAttempts(Properties.INVALID_USER, Properties.SERVICE_PASSWORD)) {
        ReportCommonFuncs.Report_a_verify(1, "Pass", "N");
    } else {
        ReportCommonFuncs.Report_a_verify(1, "Fail", "Y");
    }
    //Step2 Verify the text boxes and the Login button
    //Result: The text boxes have a red border and the Login button is  disabled.
    //"Forgot Password" link  remain available.
    var objTextboxColor = verifyFieldColor();
    var objLoginBtn = AmazonCommonFuncs.verifyButtonDisabled("Login");
    var objForPwdLink = AmazonCommonFuncs.verifyLinkEnabled("Forgot Password");
    if (objTextboxColor && objLoginBtn && objForPwdLink) {
        ReportCommonFuncs.Report_a_verify(2, "Pass", "N");
    } else {
        ReportCommonFuncs.Report_a_verify(2, "Fail", "Y");
    }


    CommonFuncs.Verify_final_result(_final_result);
    CommonFuncs.Finish_test();

    function verifyFieldColor() {
        try {
            var Page = CommonVars.page;
            var uname_input = Page.Find("Name", "WPFObject(\"txtUserName\")", _depth);
            var pass_input = Page.Find("Name", "WPFObject(\"txtPasswordBox\")", _depth);
            if (uname_input.BorderBrush.ClrClassName == "SolidColorBrush" && pass_input.BorderBrush.ClrClassName == "SolidColorBrush") {
                Log.Message("Text boxes have a red border");
                return true;
            } else {
                Log.Message("Text boxes have no a red border");
                return false;
            }
        } catch (e) {
            Log.Message("verifyFieldColor() Error" + e.description);
        }
    }
}
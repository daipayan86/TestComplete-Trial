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
//USEUNIT UID2489_Precondition
//USEUNIT Unexpected_Window
/************************************************************************************
Test Steps:
===========
Step1 Click on Forgot Password on the Login screen and verfiy the UI.
Result: It displays a dialog box prompting the user to enter a User Name,with submit and cancel button.

Step2 "Enter the Username 
eg:QaUserForgot
Click on Submit"
Result:"It displays a dialog box with the security question, Amazon QA Test, and prompt the user for a response,<Submit> and <Cancel> buttons ."

Step3 "Enter response for the security question eg:Test123"
Result:It displays edit box to set new password. New password and confirm password fields are displayed.

Step 4 "Verify that the screen displays 
      - <SAVE> and <CANCEL> buttons 
      - New Password 
      - Password Confirmation"

Result:"The Change Password Screen displays 
      - <SAVE> and <CANCEL> buttons 
      - New Password 
      - Password Confirmation"


Step 5 "Enter a new password: Password3! and confirm password."
Result:"It successfully logs into Avenio (Millisect) application.It displays case list."


Created By: Janardhana
***********************************************************************************/
function UID2375() {
    Properties.TC = "UID2375_Forgotten_Password_UI";
    CommonFuncs.Begin_test();

    AmazonCommonFuncs.CloseApplicaton(Properties.APP_NAME);
    AmazonCommonFuncs.LoadApplication(Properties.APP_NAME);

    //Step1 Click on Forgot Password on the Login screen and verfiy the UI.
    //Result: It displays a dialog box prompting the user to enter a User Name,with submit and cancel button.
    AmazonCommonFuncs.clickOnLink("Forgot Password");
    Delay(wait_time);
    var objForgotPwdScreen = verifyForgotPwdScreen("Forgot Password", "User Name");
    var objSubmitBtn = AmazonCommonFuncs.verifyBtnByName("Submit");
    var objCancelBtn = AmazonCommonFuncs.verifyBtnByName("Cancel");
    if (objForgotPwdScreen && objSubmitBtn && objCancelBtn) {
        ReportCommonFuncs.Report_a_verify(1, "Pass", "N");
    } else {
        ReportCommonFuncs.Report_a_verify(1, "Fail", "Y");
    }
    //Step2 "Enter the Username 
    //eg:QaUserForgot
    //Click on Submit"
    //Result:"It displays a dialog box with the security question, Amazon QA Test, and prompt the user for a response,<Submit> and <Cancel> buttons ."
    enterValueInField("Forgot Password", "User Name", Properties.FIRSTTIME_USER, "TextBox");
    AmazonCommonFuncs.clickBtnByName("Submit");
    Delay(wait_time);
    var objSecuQue = verifyForgotPwdScreen("Forgot Password Security Question", "Security Question");
    var objAnsToSecuQue = verifyForgotPwdScreen("Forgot Password Security Question", "Answer to Security Question");
    var objSubmitBtn = AmazonCommonFuncs.verifyBtnByName("Submit");
    var objCancelBtn = AmazonCommonFuncs.verifyBtnByName("Cancel");
    if (objSecuQue && objAnsToSecuQue && objSubmitBtn && objCancelBtn) {
        ReportCommonFuncs.Report_a_verify(2, "Pass", "N");
    } else {
        ReportCommonFuncs.Report_a_verify(2, "Fail", "Y");
    }

    //Step3 "Enter response for the security question eg:Test123"
    //Result:It displays edit box to set new password. New password and confirm password fields are displayed.
    enterValueInField("Forgot Password Security Question", "Answer to Security Question", Properties.SECURITY_ANSWER, "TextBox");
    AmazonCommonFuncs.clickBtnByName("Submit");
    Delay(wait_time);
    var objNewPassword = verifyForgotPwdScreen("Forgotten Password Reset Screen", "New Password");
    var objConfirmPwd = verifyForgotPwdScreen("Forgotten Password Reset Screen", "Password Confirmation");
    if (objNewPassword && objConfirmPwd) {
        ReportCommonFuncs.Report_a_verify(3, "Pass", "N");
    } else {
        ReportCommonFuncs.Report_a_verify(3, "Fail", "Y");
    }

    //Step 4 "Verify that the screen displays 
    //      - <SAVE> and <CANCEL> buttons 
    //      - New Password 
    //      - Password Confirmation"

    //Result:"The Change Password Screen displays 
    //      - <SAVE> and <CANCEL> buttons 
    //      - New Password 
    //      - Password Confirmation"
    var objNewPassword = verifyForgotPwdScreen("Forgotten Password Reset Screen", "New Password");
    var objConfirmPwd = verifyForgotPwdScreen("Forgotten Password Reset Screen", "Password Confirmation");
    var objSaveBtn = AmazonCommonFuncs.verifyBtnByName("Save");
    var objCancelBtn = AmazonCommonFuncs.verifyBtnByName("Cancel");
    if (objNewPassword && objConfirmPwd && objSaveBtn && objCancelBtn) {
        ReportCommonFuncs.Report_a_verify(4, "Pass", "N");
    } else {
        ReportCommonFuncs.Report_a_verify(4, "Fail", "Y");
    }

    //Step 5 "Enter a new password: Password3! and confirm password."
    //Result:"It successfully logs into Avenio (Millisect) application.It displays case list."
    enterValueInField("Forgotten Password Reset Screen", "New Password", Properties.FORGOT_NEW_PASSWORD, "PasswordBox");
    enterValueInField("Forgotten Password Reset Screen", "Password Confirmation", Properties.FORGOT_NEW_CONFIRMPWD, "RePasswordBox");
    AmazonCommonFuncs.clickBtnByName("Save");
    Delay(wait_time);
    verifysuccessMsg("Change Password", "Password Changed Successfull..", true);
    Delay(wait_time_very_long);
    Delay(wait_time_very_long);
    ClickNotificationWindow1("OK", "PopupActionWindow");
    Delay(wait_time_very_long);
    ClickNotificationWindow1("OK", "HwndSource");
    Delay(wait_time_long);
    Delay(wait_time_long);
    if (verifyUser(Properties.FIRSTTIME_USER)) {
        ReportCommonFuncs.Report_a_verify(5, "Pass", "N");
    } else {
        ReportCommonFuncs.Report_a_verify(5, "Fail", "Y");
    }


    CommonFuncs.Verify_final_result(_final_result);
    CommonFuncs.Finish_test();

    function verifyForgotPwdScreen(screenName, labelName) {
        try {
            var Page = CommonVars.page;
            PropArray = new Array("WndCaption");
            ValuesArray = new Array(screenName);
            var objForgotPwdscreen = Page.Find(PropArray, ValuesArray, _depth);
            if (objForgotPwdscreen) {
                objForgotPwdscreen.SetFocus();
                PropArray = new Array("ClrClassName", "WPFControlText");
                ValuesArray = new Array("TextBlock", labelName);
                var objVerifyLabel = Page.Find(PropArray, ValuesArray, _depth);
                if (objVerifyLabel) {
                    Log.Message(labelName + "popup window is opened");
                    return true;
                } else {
                    Log.Message(labelName + "popup window is not opened");
                    return false;
                }
            } else {
                Log.Message(objForgotPwdscreen + "Not Found");
                return false;
            }
        } catch (e) {
            Log.Message("verifyForgotPwdScreen() Error" + e.description);
        }
    }

    function enterValueInField(screenName, labelName, valuetoEnter, elementtype) {
        try {
            var Page = CommonVars.page;
            PropArray = new Array("ClrClassName", "WPFControlText");
            ValuesArray = new Array("DefaultWindow", screenName);
            var objForgotPwdscreen = Page.Find(PropArray, ValuesArray, _depth);
            //var ScreenTopPx = objForgotPwdscreen.ScreenTop;
            if (objForgotPwdscreen) {
                objForgotPwdscreen.HoverMouse();
                objForgotPwdscreen.Click();
                PropArray = new Array("VisibleOnScreen", "WPFControlText");
                ValuesArray = new Array("True", labelName);
                var objVerifyLabel = objForgotPwdscreen.Find(PropArray, ValuesArray, _depth);
                var objparent = objVerifyLabel.Parent;
                //var ScreenTopPx = objVerifyLabel.ScreenTop;
                if (objVerifyLabel)
                    PropArray = new Array("Name", "VisibleOnScreen");
                ValuesArray = new Array("WPFObject(\"" + elementtype + "*", "True");
                var objVerifyField = objparent.Find(PropArray, ValuesArray, _depth);
                objVerifyField.Click();
                objVerifyField.Keys(valuetoEnter);
                if (objVerifyField.wText == valuetoEnter) {
                    Log.Message(valuetoEnter + "value is entered in the in the Field");
                    return true;
                } else {
                    Log.Message(valuetoEnter + "value is entered in the in the Field");
                    return false;
                }
            } else {
                Log.Message(objForgotPwdscreen + "Not Found");
                return false;
            }
        } catch (e) {
            Log.Message("enterValueInField1() Error" + e.description);
        }
    }

    function verifysuccessMsg(Screenname, ContentText, ifContains) {
        var ifContains = false || ifContains
        try {
            var Page = CommonVars.page;
            PropArray = new Array("WndCaption");
            ValuesArray = new Array(Screenname);
            var notificationwindow = Page.Find(PropArray, ValuesArray, _depth);
            //ClrClassName Content
            if (notificationwindow.Exists) {
                if (ifContains) {
                    PropArray = new Array("ClrClassName");
                    ValuesArray = new Array("ContentControl");
                    var notificationwindowOkBtn = Page.Find(PropArray, ValuesArray, _depth);
                    if (aqString.Find(notificationwindowOkBtn.Content, ContentText) != -1) {
                        clickOKOnSuccessMsg(Screenname);
                        Log.Message("Substring '" + ContentText + "' was found in string '");
                        return true;
                    } else {
                        Log.Message("Substring '" + ContentText + "' was NOT found in string '");
                        return false;
                    }
                }
            }
        } catch (e) {
            Log.Message("verifyChangePwdMsg() Error" + e.description);
        }
    }

    function clickOKOnSuccessMsg(Screenname) {
        try {
            var Page = CommonVars.page;
            PropArray = new Array("WndCaption");
            ValuesArray = new Array(Screenname);
            var notificationwindow = Page.Find(PropArray, ValuesArray, _depth);
            if (notificationwindow.Exists) {
                PropArray = new Array("Name");
                ValuesArray = new Array("WPFObject(\"OKButton\")");
                var notificationwindowOkBtn = Page.Find(PropArray, ValuesArray, _depth);
                if (notificationwindowOkBtn.Exists) {
                    notificationwindowOkBtn.Click();
                }
            }
        } catch (e) {
            Log.Message("clickOKOnNotificationWindow() Error" + e.description);
        }
    }

    function verifyUser(Username) {
        try {
            var Page = CommonVars.page;
            PropArray = new Array("ClrClassName", "Name");
            ValuesArray = new Array("TextBlock", "WPFObject(\"userNameText\")");
            var objUserVerfiy = Page.Find(PropArray, ValuesArray, _depth);
            PropArray = new Array("WPFControlText");
            ValuesArray = new Array("New Job");
            var objNewJobVerify = Page.Find(PropArray, ValuesArray, _depth);
            if (objUserVerfiy.WPFControlText == Username && objNewJobVerify.Exists) {
                Log.Message("User is logged in and Job list is displayed");
                return true;
            } else {
                return false;
            }
        } catch (e) {
            Log.Message("verifyUser() Error" + e.description);
        }
    }
}
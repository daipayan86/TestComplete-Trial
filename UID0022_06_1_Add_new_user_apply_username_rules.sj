﻿//USEUNIT _begin
//USEUNIT _end
//USEUNIT AmazonCommonFuncs
//USEUNIT CommonFuncs
//USEUNIT CommonVars
//USEUNIT DbConn
//USEUNIT HTMLReporting
//USEUNIT Import
//USEUNIT Library
//USEUNIT PreConditionScript
//USEUNIT Properties
//USEUNIT ReportCommonFuncs
//USEUNIT Repository
//USEUNIT SysAdminCommonFuncs
//USEUNIT Unexpected_Window


/************************************************************************************
Test Steps:
===========
Step1 Login as service user.
Result: It successfully logs into Amazon application. It displays case list.

Step2 From the top head bar  Select user
Result: It displays user list.

Step3 Click on Add to create a new user
Result: It displays the Add User Page.

Step4 In Add user page enter
First Name : Jane
Last Name : Doe
User Name : 
Role : Administrator
Password : Password123!
Re-Enter Password : Password123!
User Status : Active
 
 
Click on save
Result: Save button is disabled.

Step5 In Add user page changed the username to the following:
 
User Name : QQ
 
Click on save
Result: It displays a popup indicating the error. Save button is disabled.

Step6 In Add user page changed the username to the following:
 
User Name : _QaUser
 
Click on save
Result: It displays a popup indicating the error. Save button is disabled.

Step7 In Add user page changed the username to the following:
 
User Name : QaUser!@#$%
 
Click on save
Result: It displays a popup indicating the error. Save button is disabled.

Step8 In Edit user page changed the username to the following:
 
User Name : Q123456789012345
 
Click on save
Result: It displays a popup indicating the error.   Save button is disabled

Step9 In Edit user page changed the username to the following:
 
User Name : Q__
 
Click on save
Result: It displays a popup indicating the error.   Save button is disabled

Step10 In add user page change the username to the following:
Username: Q_A


Click on Save
Result: It saves new user with role assigned. It displays Userlist page with  Username & Roles

Step11 Select the user Q__A
Result: It displays the Edit User Page.

Step12 In Edit user page changed the username to the following:
 
User Name : 012345678901234
 
Click on save
Result: It saves new user with role assigned. It displays Userlist page with  Username & Roles

Step13 Select the user 012345678901234
Result: It displays the Edit User Page.

Step14 In Edit user page changed the username to the following:
 
User Name : QaUser_22
 
Click on save
Result: It saves new user with role assigned. It displays Userlist page with  Username & Roles


 Created: 03/11/2016       Created By: Mobine Antony
*************************************************************************************/

function UID0022(){

  Properties.TC = "UID0022_06_1_Add_new_user_apply_username_rules";
  CommonFuncs.Begin_test();
  
  AmazonCommonFuncs.CloseApplicaton(Properties.APP_NAME);
	AmazonCommonFuncs.LoadApplication(Properties.APP_NAME);
  //Step1 Login as service user.
  //Result: It successfully logs into Amazon application. It displays case list.
  if (AmazonCommonFuncs.login(Properties.ADMIN_ID,Properties.ADMIN_PASSWORD)) {
	ReportCommonFuncs.Report_a_verify(1, "PASS", "N");
	} else {
	ReportCommonFuncs.Report_a_verify(1, "Fail", "Y");
	}
  //Step2 From the top head bar  Select user
  //Result: It displays user list.
  AmazonCommonFuncs.MenuNavigate("User Management");
  Delay(wait_time);
	if (SysAdminCommonFuncs.verifyUserList()) {
	ReportCommonFuncs.Report_a_verify(2, "PASS", "N");
	} else {
	ReportCommonFuncs.Report_a_verify(2, "Fail", "Y");
	}
  //Step3 Click on Add to create a new user
  //Result: It displays the Add User Page.
  AmazonCommonFuncs.clickBtnByName("Create User");
	if (SysAdminCommonFuncs.verifyUserPage()) {
	ReportCommonFuncs.Report_a_verify(3, "PASS", "N");
	} else {
	ReportCommonFuncs.Report_a_verify(3, "Fail", "Y");
	}
  //Step4 In Add user page enter
  //First Name : Jane
  //Last Name : Doe
  //User Name : 
  //Role : Administrator
  //Password : Password123!
  //Re-Enter Password : Password123!
  //User Status : Active

  //Click on save
  //Result: Save button is disabled.
  enterTextNearLabel("First Name", "Jane","TextBox");
  enterTextNearLabel("Last Name", "Doe","TextBox");
  enterTextWithName(idMap['enterTextWithName']['textUserNameCreate'], "","TextBox");
  enterTextNearLabel("RolesSelection","AdminUser","ComboBox");
  enterTextNearLabel("PasswordBox", "Password123!", "PasswordBox");
  enterTextNearLabel("RePasswordBox", "Password123!", "PasswordBox");
//  enterTextNearLabel("Email", "abc@xyz.com", "TextBox");
  AmazonCommonFuncs.clickBtnByName("Save");
  // Did not do Verification for this part since could not find any properties for disabled
	if (0) {
	ReportCommonFuncs.Report_a_verify(4, "PASS", "N");
	} else {
	ReportCommonFuncs.Report_a_verify(4, "Fail", "Y");
	}
  //Step5 In Add user page changed the username to the following:
  //User Name : QQ
  //Click on save
  //Result: It displays a popup indicating the error. Save button is disabled.
	enterTextWithName(idMap['enterTextWithName']['textUserNameCreate'], "QQ","TextBox");
  AmazonCommonFuncs.clickBtnByName("Save");
  if (AmazonCommonFuncs.VerifyNotificationWindow("Error") && AmazonCommonFuncs.verifyButtonDisabled("Save")) {
	ReportCommonFuncs.Report_a_verify(5, "PASS", "N");
	} else {
	ReportCommonFuncs.Report_a_verify(5, "Fail", "Y");
	}
  //Step6 In Add user page changed the username to the following:
  //User Name : _QaUser
  //Click on save
  //Result: It displays a popup indicating the error. Save button is disabled.
	enterTextWithName(idMap['enterTextWithName']['textUserNameCreate'], "_QaUser","TextBox");
  AmazonCommonFuncs.clickBtnByName("Save");
  
  if (AmazonCommonFuncs.verifyError()) {
	ReportCommonFuncs.Report_a_verify(6, "PASS", "N");
	} else {
	ReportCommonFuncs.Report_a_verify(6, "Fail", "Y");
	}
  //Step7 In Add user page changed the username to the following:
  //User Name : QaUser!@#$%
  //Click on save
  //Result: It displays a popup indicating the error. Save button is disabled.
	enterTextWithName(idMap['enterTextWithName']['textUserNameCreate'], "QaUser!@#$%","TextBox");
  AmazonCommonFuncs.clickBtnByName("Save");
  if (AmazonCommonFuncs.verifyError()) {
	ReportCommonFuncs.Report_a_verify(7, "PASS", "N");
	} else {
	ReportCommonFuncs.Report_a_verify(7, "Fail", "Y");
	}
  //Step8 In Edit user page changed the username to the following:
  //User Name : Q123456789012345
  //Click on save
  //Result: It displays a popup indicating the error.   Save button is disabled
	enterTextWithName(idMap['enterTextWithName']['textUserNameCreate'], "Q123456789012345","TextBox");
  AmazonCommonFuncs.clickBtnByName("Save");
  if (AmazonCommonFuncs.verifyError()) {
	ReportCommonFuncs.Report_a_verify(8, "PASS", "N");
	} else {
	ReportCommonFuncs.Report_a_verify(8, "Fail", "Y");
	}
  //Step9 In Edit user page changed the username to the following:
  //User Name : Q__
  //Click on save
  //Result: It displays a popup indicating the error.   Save button is disabled

	enterTextWithName(idMap['enterTextWithName']['textUserNameCreate'], "Q__","TextBox");
  AmazonCommonFuncs.clickBtnByName("Save");
  if(AmazonCommonFuncs.verifyError()){
	ReportCommonFuncs.Report_a_verify(9, "PASS", "N");
	} else {
	ReportCommonFuncs.Report_a_verify(9, "Fail", "Y");
	}
  
//    var verifyDataIntable = AmazonCommonFuncs.TableDataVerify(idMap['Table']['userlist'], "User Name", "QaUser", "First Name", "John");
//  if (SysAdminCommonFuncs.verifyUserList() && verifyDataIntable) {
  
  //Step10 In add user page change the username to the following:
  //Username: Q_A
  //Click on Save
  //Result: It saves new user with role assigned. It displays Userlist page with  Username & Roles
  AmazonCommonFuncs.TableDataModify(idMap['Table']['userlist'], "User Name", "Q_A", "", "Edit");
  enterTextWithName(idMap['enterTextWithName']['textUserNameCreate'], "Q_A","TextBox");
  AmazonCommonFuncs.clickBtnByName("Save");
	if (AmazonCommonFuncs.TableDataVerify(idMap['Table']['userlist'], "User Name", "Q_A", "User Role", "AdminUser")) {
	ReportCommonFuncs.Report_a_verify(10, "PASS", "N");
	} else {
	ReportCommonFuncs.Report_a_verify(10, "Fail", "Y");
	}
  
  //Step11 Select the user Q__A
  //Result: It displays the Edit User Page.
  AmazonCommonFuncs.TableDataModify(idMap['Table']['userlist'], "User Name", "Q_A", "", "Edit");
  if (AmazonCommonFuncs.verifyBtnByName("Edit")) {
	ReportCommonFuncs.Report_a_verify(11, "PASS", "N");
	} else {
	ReportCommonFuncs.Report_a_verify(11, "Fail", "Y");
	}
  //Step12 In Edit user page changed the username to the following:
  //User Name : 012345678901234
  //Click on save
  //Result: It saves new user with role assigned. It displays Userlist page with  Username & Roles
  AmazonCommonFuncs.TableDataModify(idMap['Table']['userlist'], "User Name", "012345678901234", "", "Edit")
  enterTextWithName(idMap['enterTextWithName']['textUserNameCreate'], "QaUser_22","TextBox");
  AmazonCommonFuncs.clickBtnByName("Save");
  if (AmazonCommonFuncs.TableDataVerify(idMap['Table']['userlist'], "User Name", "QaUser_22", "User Role", "AdminUser")) {
	ReportCommonFuncs.Report_a_verify(12, "PASS", "N");
	} else {
	ReportCommonFuncs.Report_a_verify(12, "Fail", "Y");
	}
  //Step13 Select the user 012345678901234
  //Result: It displays the Edit User Page.
	AmazonCommonFuncs.TableDataModify(idMap['Table']['userlist'], "User Name", "012345678901234", "", "Edit")
  if (verifyBtnByName("Edit")) {
	ReportCommonFuncs.Report_a_verify(13, "PASS", "N");
	} else {
	ReportCommonFuncs.Report_a_verify(13, "Fail", "Y");
	}
  //Step14 In Edit user page changed the username to the following:
  //User Name : QaUser_22
  //Click on save
  //Result: It saves new user with role assigned. It displays Userlist page with  Username & Roles
	enterTextWithName(idMap['enterTextWithName']['textUserNameCreate'], "QaUser_22","TextBox");
  AmazonCommonFuncs.clickBtnByName("Save");
  if (AmazonCommonFuncs.TableDataVerify(idMap['Table']['userlist'], "User Name", "QaUser_22", "First Name", "Jane")) {
	ReportCommonFuncs.Report_a_verify(14, "PASS", "N");
	} else {
	ReportCommonFuncs.Report_a_verify(14, "Fail", "Y");
	}
  //Logout Function added
  AmazonCommonFuncs.Logout();
  
CommonFuncs.Verify_final_result(_final_result);
CommonFuncs.Finish_test();
}
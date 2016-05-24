//
// (c) 2015 Appirio, Inc.
//
// Test Class for AskITQuickLinksCtrl Controller class
//
// March 24, 2015     Samarth Sikand        Original(T-373053)
// A test commit
@isTest
private class AskITQuickLinksCtrlTest {

    static testMethod void testAskITQuickLinksPage() {
      //Creating Test Data
      createTestData();
      
      //Setting Page Reference of Page 
      PageReference pageRef = Page.AskITQuickLinks;
      Test.setCurrentPage(pageRef);
      
      AskITQuickLinksCtrl controller = new AskITQuickLinksCtrl();
       
    }
    
    //@description: Test method to check coverage of AskITQuickLinksCtrl class
    //@param: none
    //@return: none
    private static void createTestData() {
    	List<Quick_Link__c> lstQuickLink = new List<Quick_Link__c>(); //List of new Quick Links
    	List<Attachment> lstAttachment = new List<Attachment>(); //List of Attachments
    	
    	Quick_Link__c newQuickLink = TestUtility.createQuickLink('Test Link', true, 'https://google.com', false);
    	lstQuickLink.add(newQuickLink);
    	
    	Quick_Link__c newQuickLink1 = TestUtility.createQuickLink('Test Link 1', true, 'https://facebook.com', false);
    	lstQuickLink.add(newQuickLink1);
    	
    	Quick_Link__c newQuickLink2 = TestUtility.createQuickLink('Test Link 2', true, 'https://internet.org', false);
    	lstQuickLink.add(newQuickLink2);
    	
    	insert lstQuickLink;
    	
    	Location__c newLocation = new Location__c();
    	newLocation.SiteName__c = 'Jaipur';
    	insert newLocation;
    	
    	Blob b = Blob.valueOf('Test Data'); //Blob value of Attachment Body
    	
    	Attachment newAttach = TestUtility.createAttachment('Test Attach 1', lstQuickLink.get(0).Id, 'image/jpeg', false);
    	newAttach.Body = b;
    	lstAttachment.add(newAttach);
    	
    	Attachment newAttach1 = TestUtility.createAttachment('Test Attach 2', lstQuickLink.get(1).Id, 'image/jpeg', false);
    	newAttach1.Body = b;
    	lstAttachment.add(newAttach1);
    	
    	Attachment newAttach2 = TestUtility.createAttachment('Test Attach 3', newLocation.Id, 'image/jpeg', false);
    	newAttach2.Body = b;
    	lstAttachment.add(newAttach2);
    	
    	insert lstAttachment;
    }
}

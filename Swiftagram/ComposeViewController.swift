//
//  ComposeViewController.swift
//  Swiftagram
//
//  Created by Rachel Stevenson on 11/24/15.
//  Copyright © 2015 rachelrockaway. All rights reserved.
//

import UIKit
import Parse
import ParseUI
import Bolts

class ComposeViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate {
    
    @IBOutlet weak var captionTextView: UITextView!
    @IBOutlet weak var previewImage: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        captionTextView.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addImageTapped(sender: AnyObject) {
        
        let imagePicker = UIImagePickerController()
        
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        imagePicker.mediaTypes = UIImagePickerController.availableMediaTypesForSourceType(.PhotoLibrary)!
        imagePicker.allowsEditing = false
        
        self.presentViewController(imagePicker, animated: true
            , completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        self.previewImage.image = image
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func textViewShouldEndEditing(textView:UITextView) -> Bool {
        captionTextView.resignFirstResponder()
        return true;
    }
    
    
    @IBAction func composeTapped(sender: AnyObject) {
        
        let date = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        let localDate = dateFormatter.stringFromDate(date)
        
        let imageToBeUploaded = self.previewImage.image
        let imageData = UIImagePNGRepresentation(imageToBeUploaded!)!
        
        let file: PFFile = PFFile(data: imageData)!
        let fileCaption: String = self.captionTextView.text
        
        let photoToUpload = PFObject(className: "Posts")
        photoToUpload["Image"] = file
        photoToUpload["Caption"] = fileCaption
        photoToUpload["addedBy"] = PFUser.currentUser()?.username
        photoToUpload["date"] = localDate
        
        do {
            try photoToUpload.save()
            
            print("Successfully posted.")
            
        }catch {
            print("Error.")
        

    }
    
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  DEMOViewController.h
//  NSUserDefaultSample
//
//  Created by Aditya on 19/12/13.
//  Copyright (c) 2013 Aditya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DEMOViewController : UIViewController


@property(nonatomic, weak) IBOutlet UITextField *textFieldName;
@property(nonatomic, weak) IBOutlet UITextField *textFieldAddress;
@property(nonatomic, weak) IBOutlet UITextField *textFieldPhone;

-(IBAction)saveData;
-(IBAction)clearData;
-(IBAction)readData;



@end

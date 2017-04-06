//
//  HypnoAppDelegate.h
//  MyHypno
//
//  Created by Adam Lewis on 7/3/13.
//  Copyright (c) 2013 Athens State University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HypnoView.h"

@interface HypnoAppDelegate : UIResponder <UIApplicationDelegate, UIScrollViewDelegate>
{
    HypnoView *view;
}

@property (strong, nonatomic) UIWindow *window;

@end

//
//  DetailViewController.h
//  readerSample
//
//  Created by Takumi Yamamoto on 2013/05/04.
//  Copyright (c) 2013年 Takumi Yamamoto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
{
    NSString* strLink;
    NSString* strDesc;
}
- (id)initWithDesc:(NSString *)desc link:(NSString *)link;

@end

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
    int iDataIndex;
    NSMutableDictionary* mdicRssData;
}
- (id)initWithDataIndex:(int)iIndex;

@end

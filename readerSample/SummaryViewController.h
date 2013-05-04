//
//  SummaryViewController.h
//  readerSample
//
//  Created by Takumi Yamamoto on 2013/05/04.
//  Copyright (c) 2013年 Takumi Yamamoto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SummaryViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,NSXMLParserDelegate>
{
    BOOL isItem;
    BOOL isTitle;
    BOOL isDesc;
    BOOL isLink;
    
    NSMutableArray* maryTitle;
    NSMutableArray* maryLink;
    NSMutableArray* maryDesc;
    
    NSMutableArray* maryData;
    
}
- (id)init;

@end

//
//  DetailViewController.m
//  readerSample
//
//  Created by Takumi Yamamoto on 2013/05/04.
//  Copyright (c) 2013年 Takumi Yamamoto. All rights reserved.
//

#import "DetailViewController.h"
#import "WebViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#define TAG_DESCTIPTION 100

- (id)initWithDataIndex:(int)iIndex
{
    
    
    self = [super init];
    if(self){
        iDataIndex = iIndex;
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSString *directory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *filePath = [directory stringByAppendingPathComponent:@"hoge.txt"];
    NSArray* aryFromFileData = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSMutableArray* maryData = [NSMutableArray arrayWithArray:aryFromFileData];
    mdicRssData = [maryData objectAtIndex:iDataIndex];
    
    UISwipeGestureRecognizer* swipeRightGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(selSwipeRightGesture:)];
    swipeRightGesture.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRightGesture];
    
    //int iDescLength
    
    UILabel* labelDesc = [UILabel new];
    labelDesc.frame = CGRectMake(0,0,self.view.frame.size.width,400);
    labelDesc.text = [mdicRssData objectForKey:@"title"];
    labelDesc.userInteractionEnabled = YES;
    labelDesc.numberOfLines = 0;
    labelDesc.tag = TAG_DESCTIPTION;
    //labelDesc.backgroundColor = [UIColor redColor];
    [self.view addSubview:labelDesc];
    
    [mdicRssData setObject:@"YES" forKey:@"status"];
    [maryData replaceObjectAtIndex:iDataIndex withObject:mdicRssData];
    
    BOOL successful = [NSKeyedArchiver archiveRootObject:maryData toFile:filePath];
    
    if(!successful){
        NSLog(@"ファイルの保存に失敗しました");
    }
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* touch = [[event allTouches] anyObject];
    NSLog(@"%d",touch.view.tag);
    
    if(touch.view.tag == TAG_DESCTIPTION){
        WebViewController* webCnt = [[WebViewController alloc] initWithURL:[[NSURL alloc] initWithString:[mdicRssData objectForKey:@"link"]]];
        UINavigationController* naviCnt = [[UINavigationController alloc] initWithRootViewController:webCnt];
        [self presentViewController:naviCnt animated:YES completion:nil];
    }
    
}

-(void)selSwipeRightGesture:(UISwipeGestureRecognizer *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

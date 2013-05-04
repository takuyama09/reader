//
//  TopViewController.m
//  readerSample
//
//  Created by Takumi Yamamoto on 2013/05/04.
//  Copyright (c) 2013年 Takumi Yamamoto. All rights reserved.
//

#import "TopViewController.h"
#import "SummaryViewController.h"

@interface TopViewController ()

@end

@implementation TopViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)init
{
    self = [super init];
    if(self){
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(20,20,60,60)];
    label.text = @"hogehoge";
    //[self.view addSubview:label];
    
    UITableView* tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,80,self.view.frame.size.width,self.view.frame.size.height-80) style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if(cell == nil){
        // 無ければ作成する
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
		

	}
    
    // Configure the cell...
    
    cell.textLabel.text = @"ほげほげ";
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    SummaryViewController* summaryCnt = [[SummaryViewController alloc] init];
    summaryCnt.title = @"さまりー";
    [self.navigationController pushViewController:summaryCnt animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

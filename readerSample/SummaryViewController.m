//
//  SummaryViewController.m
//  readerSample
//
//  Created by Takumi Yamamoto on 2013/05/04.
//  Copyright (c) 2013年 Takumi Yamamoto. All rights reserved.
//

#import "SummaryViewController.h"
#import "DetailViewController.h"

@interface SummaryViewController ()

@end

@implementation SummaryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)init{
    self = [super init];
    if(self){
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    maryTitle = [NSMutableArray array];
    maryLink = [NSMutableArray array];
    maryDesc = [NSMutableArray array];
    
    NSURL* url = [[NSURL alloc] initWithString:@"http://feeds.feedburner.com/hatena/b/hotentry"];
    NSXMLParser* rssParser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    [rssParser setDelegate:self];
    [rssParser parse];
    
    UITableView* tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height) style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    
    
    
    
    
    
    
}

- (void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName
	attributes:(NSDictionary *)attributeDict {
    
    
    //NSLog(@"%@" , elementName);
    
    if([elementName isEqualToString:@"item"]){
        isItem = YES;
    }
    
    if([elementName isEqualToString:@"title"] && isItem == YES){
        isTitle = YES;
    }
    
    if([elementName isEqualToString:@"link"] && isItem == YES){
        isLink = YES;
    }
    
    if([elementName isEqualToString:@"description"] && isItem == YES){
        isDesc = YES;
    }
    
    
    
    
    
}

- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName {
}

- (void)parser:(NSXMLParser *)parser
foundCharacters:(NSString *)string {
    
    if(isTitle && isItem){
        isTitle = NO;
        [maryTitle addObject:string];
    }
    
    if(isLink && isItem){
        isLink = NO;
        [maryLink addObject:string];
    }
    
    if(isDesc && isItem){
        isDesc = NO;
        [maryDesc addObject:string];
    }
    
    
    
}

- (void)parser:(NSXMLParser *)parser
parseErrorOccurred:(NSError *)parseError {
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [maryTitle count];
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
    
    cell.textLabel.text = [maryTitle objectAtIndex:indexPath.row];
    
    
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"hogehoge %@",maryDesc);
    
    NSString* strLink = [maryLink objectAtIndex:indexPath.row];
    NSString* strDesc = [maryDesc objectAtIndex:indexPath.row];
    
    
    DetailViewController* detailCnt = [[DetailViewController alloc] initWithDesc:strDesc link:strLink];
    detailCnt.title = [maryTitle objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:detailCnt animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
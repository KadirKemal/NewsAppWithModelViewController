//
//  ViewController.m
//  NewsAppWithModelViewController
//
//  Created by Kadir Kemal Dursun on 20/09/2017.
//  Copyright © 2017 Kadir Kemal Dursun. All rights reserved.
//

#import "ViewController.h"
#import "NewsModel.h"
#import "NewsTableViewCell.h"
#import "UIImageView+AFNetworking.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, NewsModelDelegate>

@property (weak, nonatomic) IBOutlet UITableView *newsTable;

@property NewsModel* newsModel;
@property NSArray<NewsModelItem *> *newsList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _newsTable.delegate = self;
    _newsTable.dataSource = self;
    
    _newsModel = [NewsModel new];
    _newsModel.delegate = self;
    [_newsModel requestNews];
}

-(void) didReceiveNewsUpdate:(id)newsModel news:(NSArray <NewsModelItem *>*) news{
    _newsList = news;
    [_newsTable reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _newsList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* cellIdentifier = @"NewsCellIdentifier";
    
    NewsModelItem *newsModelItem = [_newsList objectAtIndex:indexPath.row];
    
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    [cell.titleLabel setText:newsModelItem.title];
    [cell.authorLabel setText:newsModelItem.author];
    
    cell.backgroundColor = indexPath.row % 2 == 0 ? [UIColor whiteColor] : [UIColor lightGrayColor];

    return cell;
}


@end

//
//  NewsModel.m
//  NewsAppWithModelViewController
//
//  Created by Kadir Kemal Dursun on 20/09/2017.
//  Copyright © 2017 Kadir Kemal Dursun. All rights reserved.
//

#import "NewsModel.h"
#import "AFNetworking.h"

@implementation NewsModel

-(void) requestNews{
    static NSString *newsApiKey = @"144bd4faecc4484797f3065af996d32e";
    
    NSString *urlString = [NSString stringWithFormat:@"https://newsapi.org/v1/articles?source=cnn&sortBy=top&apiKey=%@", newsApiKey];

    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
    
    [manager GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask *task, id responseObject){
        
        NSLog(@"%@", responseObject);
        NSDictionary *responseDictionary = responseObject;
        NSArray *articles = responseDictionary[@"articles"];
        
        NSMutableArray <NewsModelItem *>* news = [[NSMutableArray <NewsModelItem *> alloc] initWithCapacity:articles.count];
        for(int i=0;i<articles.count;i++){
            [news addObject:[[NewsModelItem alloc] initWithProperties:[articles objectAtIndex:i]]];
        }
        
        if(_delegate){
            [_delegate didReceiveNewsUpdate:self news:[NSArray arrayWithArray:news]];
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error){
        
        NSLog(@"%@", error);
        if(_delegate){
            [_delegate didFailNewsUpdate:self error:error];
        }
        
    }];
    
}

@end

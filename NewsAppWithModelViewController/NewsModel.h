//
//  NewsModel.h
//  NewsAppWithModelViewController
//
//  Created by Kadir Kemal Dursun on 20/09/2017.
//  Copyright © 2017 Kadir Kemal Dursun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsModelItem.h"

@protocol NewsModelDelegate

@required
-(void) didReceiveNewsUpdate:(id)newsModel news:(NSArray <NewsModelItem *>*) news;
-(void) didFailNewsUpdate:(id)newsModel error:(NSError*) error;

@end

@interface NewsModel : NSObject

@property (weak) id<NewsModelDelegate> delegate;
//I prefer using protocols to pass data from Model to Controller
//Another ways "Callbacks" and "Notification"

-(void) requestNews;

@end

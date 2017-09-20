//
//  NewsModelItem.h
//  NewsAppWithModelViewController
//
//  Created by Kadir Kemal Dursun on 20/09/2017.
//  Copyright © 2017 Kadir Kemal Dursun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModelItem : NSObject

@property (nonatomic) NSString* author;
@property (nonatomic) NSString* title;
@property (nonatomic) NSString* newsDescription;
@property (nonatomic) NSString* url;
@property (nonatomic) NSString* urlToImage;

@property (nonatomic) NSString* publishedAt;
//to make the demo app simplier, I store publishedAt as NSString (not NSDate)


-(id) initWithProperties:(NSDictionary *) properties;

@end

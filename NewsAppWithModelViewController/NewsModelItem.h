//
//  NewsModelItem.h
//  NewsAppWithModelViewController
//
//  Created by Kadir Kemal Dursun on 20/09/2017.
//  Copyright © 2017 Kadir Kemal Dursun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModelItem : NSObject

@property NSString* author;
@property NSString* title;
@property NSString* newsDescription;
@property NSString* url;
@property NSString* urlToImage;

@property NSString* publishedAt;
//to make the demo app simplier, I store publishedAt as NSString (not NSDate)


-(id) initWithProperties:(NSDictionary *) properties;

@end

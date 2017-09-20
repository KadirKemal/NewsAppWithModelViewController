//
//  NewsModelItem.m
//  NewsAppWithModelViewController
//
//  Created by Kadir Kemal Dursun on 20/09/2017.
//  Copyright © 2017 Kadir Kemal Dursun. All rights reserved.
//

#import "NewsModelItem.h"

@implementation NewsModelItem

//That method is not related for MVC, it is for demo
-(id) initWithProperties:(NSDictionary *) properties{
    if(self = [super init]){
        [self setValuesForKeysWithDictionary:properties];
    }
    return self;
}


//That method is not related for MVC, it is for demo
//I defined the method because there is a "description" value in cnn news
//ps : description is one of NSObject methods so we can not identify a variable named description
-(void)setValue:(id)value forKey:(NSString *)key{
    if([key isEqualToString:@"description"]){
        [super setValue:value forKey:@"newsDescription"];
        return;
    }
    
    [super setValue:value forKey:key];
}

@end

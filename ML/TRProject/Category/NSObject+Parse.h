//
//  NSObject+Parse.h
//  TRProject
//
//  Created by Yang Xiong on 12/12/2016.
//  Copyright © 2016 Tedu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Parse)<YYModel>
+(id)parse:(id)JSON;
@end

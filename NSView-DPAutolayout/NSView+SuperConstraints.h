//
// Created by Dani Postigo on 12/28/13.
// Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSView (SuperConstraints)

- (NSLayoutConstraint *) superConstrain: (NSLayoutAttribute) attribute constant: (CGFloat) constant;
- (NSLayoutConstraint *) superConstrainToItem: (id) item attribute: (NSLayoutAttribute) attribute constant: (CGFloat) constant;
- (NSLayoutConstraint *) selfConstrain: (NSLayoutAttribute) attribute constant: (CGFloat) constant;
@end
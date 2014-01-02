//
// Created by Dani Postigo on 12/28/13.
// Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import "NSView+ConstraintGetters.h"

@implementation NSView (ConstraintGetters)

- (NSLayoutConstraint *) leftConstraint {
    return [self constraintForAttribute: NSLayoutAttributeLeft];
}

- (NSLayoutConstraint *) rightConstraint {
    return [self constraintForAttribute: NSLayoutAttributeRight];
}

- (NSLayoutConstraint *) topConstraint {
    return [self constraintForAttribute: NSLayoutAttributeTop];
}

- (NSLayoutConstraint *) bottomConstraint {
    return [self constraintForAttribute: NSLayoutAttributeBottom];
}

- (NSLayoutConstraint *) constraintForAttribute: (NSLayoutAttribute) attribute item: (id) item {
    NSLayoutConstraint *ret = nil;
    NSArray *constraints = self.constraints;

    for (NSLayoutConstraint *constraint in constraints) {
        if (constraint.firstAttribute == attribute && constraint.secondAttribute == attribute && constraint.firstItem == item) {
            ret = constraint;
            break;
        }
    }
    return ret;
}


- (NSLayoutConstraint *) topConstraintForItem: (id) item {
    return [self constraintForAttribute: NSLayoutAttributeTop item: item];
}


- (NSLayoutConstraint *) bottomConstraintForItem: (id) item {
    return [self constraintForAttribute: NSLayoutAttributeBottom item: item];
}

- (NSArray *) constraintsModifiedToItem: (id) item {
    NSMutableArray *ret = [[NSMutableArray alloc] init];

    NSArray *constraints = [NSArray arrayWithArray: self.constraints];
    for (NSLayoutConstraint *constraint in constraints) {
        if (constraint.firstItem == self) {
            NSLayoutConstraint *newConstraint = [NSLayoutConstraint constraintWithItem: item attribute: constraint.firstAttribute relatedBy: constraint.relation toItem: constraint.secondItem attribute: constraint.secondAttribute multiplier: constraint.multiplier constant: constraint.constant];
            [ret addObject: newConstraint];
        }

        if (constraint.secondItem == self) {
            NSLayoutConstraint *newConstraint = [NSLayoutConstraint constraintWithItem: constraint.firstItem attribute: constraint.firstAttribute relatedBy: constraint.relation toItem: item attribute: constraint.secondAttribute multiplier: constraint.multiplier constant: constraint.constant];
            [ret addObject: newConstraint];
        }
    }
    return ret;
}


- (NSLayoutConstraint *) leftConstraintForItem: (id) item {
    return [self constraintForAttribute: NSLayoutAttributeLeft item: item];
}


- (NSLayoutConstraint *) rightConstraintForItem: (id) item {
    return [self constraintForAttribute: NSLayoutAttributeRight item: item];
}


- (NSLayoutConstraint *) constraintForAttribute: (NSLayoutAttribute) attribute {

    NSLayoutConstraint *ret = nil;
    NSArray *constraints = self.constraints;

    for (NSLayoutConstraint *constraint in constraints) {
        if (constraint.firstAttribute == attribute && constraint.secondAttribute == attribute) {
            ret = constraint;
            break;
        }
    }
    return ret;
}
@end
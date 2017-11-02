//
//  Alert.h
//  HarpyExample
//
//  Created by Carlos Duclos on 11/2/17.
//  Copyright © 2017 Arthur Ariel Sabintsev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Alert: UIView

@property (strong, nonatomic) NSString *titleText;
@property (strong, nonatomic) NSString *descriptionText;

+ (instancetype)createViewOn:(UIView *)parentView;

@end

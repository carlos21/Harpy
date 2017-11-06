//
//  AlertView.h
//  HarpyExample
//
//  Created by Carlos Duclos on 11/2/17.
//  Copyright © 2017 Arthur Ariel Sabintsev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AlertView: UIView

@property (strong, nonatomic) NSString *titleText;
@property (strong, nonatomic) NSString *descriptionText;
@property (strong, nonatomic) NSString *buttonText;
@property (nonatomic, copy) void (^updateActionBlock)(void);

+ (instancetype)createViewOn:(UIView *)parentView;

@end

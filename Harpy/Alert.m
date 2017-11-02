//
//  Alert.m
//  HarpyExample
//
//  Created by Carlos Duclos on 11/2/17.
//  Copyright © 2017 Arthur Ariel Sabintsev. All rights reserved.
//

#import "Alert.h"

@interface Alert()

@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end

@implementation Alert

#pragma mark - Lifecycle

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

#pragma mark - Custom Accessors

- (void)setTitleText:(NSString *)titleText {
    self.titleLabel.text = titleText;
}

- (void)setDescriptionText:(NSString *)descriptionText {
    self.descriptionLabel.text = descriptionText;
}

#pragma mark - Private

- (void)setupView {
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    self.view = [bundle loadNibNamed:NSStringFromClass([Alert class]) owner:self options:nil].firstObject;
    [self addSubview:self.view];
    self.view.frame = self.bounds;
    self.view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
}

- (void)createConstraintsOn:(UIView *)parentView {
    NSDictionary *views = @{@"view": self};
    NSArray *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[view]-0-|" options:0 metrics:nil views:views];
    NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[view]-0-|" options:0 metrics:nil views:views];
    [parentView addConstraints:verticalConstraints];
    [parentView addConstraints:horizontalConstraints];
}

#pragma mark - Actions

- (IBAction)updatePressed:(id)sender {
    NSLog(@"updatePressed");
}

#pragma mark - Public

+ (instancetype)createViewOn:(UIView *)parentView {
    Alert *alert = [[Alert alloc] initWithFrame:CGRectZero];
    alert.translatesAutoresizingMaskIntoConstraints = false;
    [parentView addSubview:alert];
    [alert createConstraintsOn:parentView];
    return alert;
}

@end

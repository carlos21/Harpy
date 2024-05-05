//
//  AlertView.m
//  HarpyExample
//
//  Created by Carlos Duclos on 11/2/17.
//  Copyright © 2017 Arthur Ariel Sabintsev. All rights reserved.
//

#import "AlertView.h"
#import "UIView+Borders.h"

@interface AlertView()

@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UIView *centerView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIButton *updateButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;

@end

@implementation AlertView

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

- (void)setButtonText:(NSString *)buttonText {
    [self.updateButton setTitle:buttonText forState:UIControlStateNormal];
}

- (void)hideCancelButton {
    [self.cancelButton setHidden:YES];
}

#pragma mark - Private

- (void)setupView {
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    self.view = [bundle loadNibNamed:NSStringFromClass([AlertView class]) owner:self options:nil].firstObject;
    [self addSubview:self.view];
    self.view.frame = self.bounds;
    self.view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    self.centerView.layer.cornerRadius = 10.0;
    self.centerView.layer.masksToBounds = YES;
    self.titleLabel.textColor = [UIColor blackColor];
    self.descriptionLabel.textColor = [UIColor blackColor];
    
    [self.updateButton addTopBorderWithHeight:1.0 andColor:[UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0]];
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
    self.updateActionBlock();
}

- (IBAction)cancelPressed:(id)sender {
    [self removeFromSuperview];
}

#pragma mark - Public

+ (instancetype)createViewOn:(UIView *)parentView forceUpdate:(BOOL)forceUpdate {
    AlertView *alert = [[AlertView alloc] initWithFrame:CGRectZero];
    alert.translatesAutoresizingMaskIntoConstraints = false;
    [parentView addSubview:alert];
    [alert createConstraintsOn:parentView];
    if (forceUpdate) {
        [alert hideCancelButton];
    }
    return alert;
}

@end

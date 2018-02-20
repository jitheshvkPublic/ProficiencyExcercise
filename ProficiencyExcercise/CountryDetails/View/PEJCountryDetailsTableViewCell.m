//
//  PEJCountryDetailsTableViewCell.m
//  ProficiencyExcercise
//
//  Created by Jithesh Valsan on 19/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

#import "PEJCountryDetailsTableViewCell.h"

@interface PEJCountryDetailsTableViewCell()
-(void)setupCell;
-(void)addConstraintForCell;
@end

@implementation PEJCountryDetailsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupCell];
    }
    return self;
}

-(void)setupCell {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.rowTitleLabel = [[PEJDynamicHeightLabel alloc]init];
    [self.contentView addSubview:self.rowTitleLabel];
    
    self.rowDescriptionLabel = [[PEJDynamicHeightLabel alloc]init];
    [self.contentView addSubview:self.rowDescriptionLabel];
    
    self.rowImageView = [[UIImageView alloc]init];
    self.rowImageView.backgroundColor = [UIColor whiteColor];
    self.rowImageView.image = [UIImage imageNamed:@"defaultimage"];
    self.rowImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.rowImageView.clipsToBounds = YES;
    self.rowImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:self.rowImageView];
    
    [self addConstraintForCell];
    [self layoutIfNeeded];
}

-(void)addConstraintForCell {
    if (@available(iOS 11.0, *)) {
        UILayoutGuide *layoutGuide = self.contentView.safeAreaLayoutGuide;
        [[self.rowTitleLabel.topAnchor constraintEqualToAnchor:self.rowTitleLabel.superview.topAnchor constant:16] setActive:YES];
        [[self.rowTitleLabel.leadingAnchor constraintEqualToAnchor:layoutGuide.leadingAnchor constant:16] setActive:YES];
        [[self.rowTitleLabel.trailingAnchor constraintEqualToAnchor:layoutGuide.trailingAnchor constant:16] setActive:YES];
        
        [[self.rowImageView.widthAnchor constraintEqualToConstant:140] setActive:YES];
        [[self.rowImageView.heightAnchor constraintEqualToConstant:140] setActive:YES];
        [[self.rowImageView.topAnchor constraintEqualToAnchor:self.rowTitleLabel.bottomAnchor constant:16] setActive:YES];
        [[self.rowImageView.centerXAnchor constraintEqualToAnchor:layoutGuide.centerXAnchor] setActive:YES];
        
        [[self.rowDescriptionLabel.topAnchor constraintEqualToAnchor:self.rowImageView.bottomAnchor constant:16] setActive:YES];
        [[self.rowDescriptionLabel.bottomAnchor constraintEqualToAnchor:self.rowDescriptionLabel.superview.bottomAnchor constant:16] setActive:YES];
        [[self.rowDescriptionLabel.leadingAnchor constraintEqualToAnchor:layoutGuide.leadingAnchor constant:16] setActive:YES];
        [[self.rowDescriptionLabel.trailingAnchor constraintEqualToAnchor:layoutGuide.trailingAnchor constant:16] setActive:YES];
    } else {
        // Fallback on earlier versions
        NSLayoutConstraint *titleLabelTopConstraint = [NSLayoutConstraint constraintWithItem:self.rowTitleLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.rowTitleLabel.superview attribute:NSLayoutAttributeTop multiplier:1 constant:16];
        NSLayoutConstraint *titleLabelLeadingConstraint = [NSLayoutConstraint constraintWithItem:self.rowTitleLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.rowTitleLabel.superview attribute:NSLayoutAttributeLeading multiplier:1 constant:16];
        NSLayoutConstraint *titleLabelTrailingConstraint = [NSLayoutConstraint constraintWithItem:self.rowTitleLabel.superview attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.rowTitleLabel attribute:NSLayoutAttributeTrailing multiplier:1 constant:16];
        
        NSLayoutConstraint *imageViewCenterXConstraint = [NSLayoutConstraint constraintWithItem:self.rowImageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.rowImageView.superview attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
        
         NSLayoutConstraint *imageViewheightConstraint = [NSLayoutConstraint constraintWithItem:self.rowImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:140];
        NSLayoutConstraint *imageViewWidthConstraint = [NSLayoutConstraint constraintWithItem:self.rowImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:140];
        
        NSLayoutConstraint *imageViewTopConstraint = [NSLayoutConstraint constraintWithItem:self.rowImageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.rowTitleLabel attribute:NSLayoutAttributeBottom multiplier:1 constant:16];
        
        NSLayoutConstraint *descriptionLabelTopConstraint = [NSLayoutConstraint constraintWithItem:self.rowDescriptionLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.rowImageView attribute:NSLayoutAttributeBottom multiplier:1 constant:16];
        NSLayoutConstraint *descriptionLabelLeadingConstraint = [NSLayoutConstraint constraintWithItem:self.rowDescriptionLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.rowDescriptionLabel.superview attribute:NSLayoutAttributeLeading multiplier:1 constant:16];
        NSLayoutConstraint *descriptionLabelTrailingConstraint = [NSLayoutConstraint constraintWithItem:self.rowDescriptionLabel.superview attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.rowDescriptionLabel attribute:NSLayoutAttributeTrailing multiplier:1 constant:16];
        NSLayoutConstraint *descriptionLabelBottomConstraint = [NSLayoutConstraint constraintWithItem:self.rowDescriptionLabel.superview attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem: self.rowDescriptionLabel attribute:NSLayoutAttributeBottom multiplier:1 constant:16];
        
        [self.contentView addConstraints:@[titleLabelTopConstraint, titleLabelLeadingConstraint, titleLabelTrailingConstraint, imageViewTopConstraint, imageViewCenterXConstraint, imageViewheightConstraint, imageViewWidthConstraint, descriptionLabelTopConstraint, descriptionLabelLeadingConstraint, descriptionLabelTrailingConstraint, descriptionLabelBottomConstraint]];
    }
}

-(void)configureCellWith:(PEJRowItemViewModel *)rowItem {
    if (rowItem) {
        self.rowTitleLabel.text = rowItem.getTitle;
        self.rowDescriptionLabel.text = rowItem.getDescription;
        self.rowImageView.image = [UIImage imageNamed:@"defaultimage"];
        [rowItem getImageDataWith:^(NSData *Data) {
            if (Data) {
                self.rowImageView.image = [UIImage imageWithData:Data];
                [self layoutIfNeeded];
            }
            else {
                self.rowImageView.image = [UIImage imageNamed:@"defaultimage"];
                [self layoutIfNeeded];
            }
        }];
    }
    else {
        self.rowTitleLabel.text = @"";
        self.rowDescriptionLabel.text = @"";
        self.rowImageView.image = [UIImage imageNamed:@"defaultimage"];
    }
    [self layoutIfNeeded];
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end

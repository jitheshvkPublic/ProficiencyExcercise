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
    self.rowImageView.image = [UIImage imageNamed:PEJDefaultImageName];
    self.rowImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.rowImageView.clipsToBounds = YES;
    self.rowImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:self.rowImageView];
    [self addConstraintForCell];
    [self setNeedsUpdateConstraints];
}

-(void)addConstraintForCell {
    //Create imageview constraints
    NSLayoutConstraint *imageViewLeadingConstraint =[NSLayoutConstraint constraintWithItem:self.rowImageView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.rowImageView.superview attribute:NSLayoutAttributeLeading multiplier:1 constant:16];
    NSLayoutConstraint *imageViewWidthConstraint = [NSLayoutConstraint constraintWithItem:self.rowImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:90];
    NSLayoutConstraint *imageViewTopConstraint = [NSLayoutConstraint constraintWithItem:self.rowImageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.rowImageView.superview attribute:NSLayoutAttributeTop multiplier:1 constant:16];
    NSLayoutConstraint *imageViewHeightConstraint = [NSLayoutConstraint constraintWithItem:self.rowImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:90];
    NSLayoutConstraint *imageViewBottomConstraint = [NSLayoutConstraint constraintWithItem:self.rowImageView.superview attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:self.rowImageView attribute:NSLayoutAttributeBottom multiplier:1 constant:16];
    //Create title label constraints
    NSLayoutConstraint *titleLabelTopConstraint = [NSLayoutConstraint constraintWithItem:self.rowTitleLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.rowTitleLabel.superview attribute:NSLayoutAttributeTop multiplier:1 constant:16];
    NSLayoutConstraint *titleLabelTrailingConstraint = [NSLayoutConstraint constraintWithItem:self.rowTitleLabel.superview attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.rowTitleLabel attribute:NSLayoutAttributeTrailing multiplier:1 constant:16];
    NSLayoutConstraint *titleLabelLeadingConstraint = [NSLayoutConstraint constraintWithItem:self.rowTitleLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.rowImageView attribute:NSLayoutAttributeTrailing multiplier:1 constant:16];
    //Create description label
    NSLayoutConstraint *descriptionLabeltopConstraint = [NSLayoutConstraint constraintWithItem:self.rowDescriptionLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.rowTitleLabel attribute:NSLayoutAttributeBottom multiplier:1 constant:16];
    NSLayoutConstraint *descriptionLabelLeadingConstraint = [NSLayoutConstraint constraintWithItem:self.rowDescriptionLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.rowImageView attribute:NSLayoutAttributeTrailing multiplier:1 constant:16];
    NSLayoutConstraint *descriptionLabelTrailingConstraint = [NSLayoutConstraint constraintWithItem:self.rowDescriptionLabel.superview attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.rowDescriptionLabel attribute:NSLayoutAttributeTrailing multiplier:1 constant:16];
    NSLayoutConstraint *descriptionLabelBottomConstraint = [NSLayoutConstraint constraintWithItem:self.rowDescriptionLabel.superview attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.rowDescriptionLabel attribute:NSLayoutAttributeBottom multiplier:1 constant:16];
    //Reduce the priority to avoid constraint break when the image view has different size content.
    imageViewHeightConstraint.priority = 999;
    //Set content hugging priority of title label more than description label to make the title
    // align to the top when there is no description.
    [self.rowTitleLabel setContentHuggingPriority:251 forAxis:UILayoutConstraintAxisVertical];
    [NSLayoutConstraint activateConstraints:@[imageViewTopConstraint, imageViewWidthConstraint, imageViewHeightConstraint, imageViewBottomConstraint, imageViewLeadingConstraint, titleLabelTopConstraint, titleLabelLeadingConstraint, titleLabelTrailingConstraint, descriptionLabeltopConstraint, descriptionLabelBottomConstraint, descriptionLabelLeadingConstraint, descriptionLabelTrailingConstraint]];
}

-(void)configureCellWith:(PEJRowItemViewModel *)rowItem {
    if (rowItem) {
        self.rowTitleLabel.text = rowItem.getTitle;
        self.rowDescriptionLabel.text = rowItem.getDescription;
        self.rowImageView.image = [UIImage imageNamed:PEJDefaultImageName];
        //Fetch image from the imageurl.
        PEJRowItemViewModel *rowItemRef = rowItem;
        [rowItemRef getImageDataWith:^(NSData *Data) {
            if (Data) {
                self.rowImageView.image = [UIImage imageWithData:Data];
            }
            else {
                self.rowImageView.image = [UIImage imageNamed:PEJDefaultImageName];
            }
            [self setNeedsUpdateConstraints];
        }];
    }
    else {
        self.rowTitleLabel.text = @"";
        self.rowDescriptionLabel.text = @"";
        self.rowImageView.image = [UIImage imageNamed:PEJDefaultImageName];
    }
    [self setNeedsUpdateConstraints];
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)prepareForReuse {
    [super prepareForReuse];
    self.rowTitleLabel.text = @"";
    self.rowDescriptionLabel.text = @"";
    self.rowImageView.image = [UIImage imageNamed:PEJDefaultImageName];
}

@end

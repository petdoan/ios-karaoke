//
//  KTSearchBar.m
//  CustomSearchBar
//
//  Created by Kurry L Tran on 12/23/12.
//  Copyright (c) 2012 Kurry L Tran. All rights reserved.
//

#import "KTSearchBar.h"
#import <QuartzCore/QuartzCore.h>

#define KEYBOARD_ACCESSORY_HEIGHT 62
#define kBackgroundOneTag 111
#define kBackgroundTwoTag 112
#define kBackgroundThreeTag 113
#define kBackgroundFourTag 114

@implementation KTSearchBar

- (void)awakeFromNib
{
    NSArray *searchBarSubViews = [[self.subviews objectAtIndex:0] subviews];

    for(int i =0; i<[searchBarSubViews count]; i++) {
        if([[searchBarSubViews objectAtIndex:i] isKindOfClass:[UIImageView class]])
        {
            [[searchBarSubViews objectAtIndex:i] removeFromSuperview];
            
            
            //            search.delegate = self.searchBar;
            
            //            [search setInputView:self.customKeyboard];
            //            [self.customKeyboard setTextView:search];
        }
    }
    
    
    UIImageView *backgroundImageView = nil;
    
    self.layer.borderColor = [[self colorWithHex:0x32363c] CGColor];
    backgroundImageView  = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search2.png"]];
    backgroundImageView.frame = CGRectMake(0.0f, 0.0f, self.bounds.size.width, self.bounds.size.height);
    
    [self addSubview:backgroundImageView];
    
    [self reloadInputViews];
  
}


- (void)layoutSubviews {
  
  [self setShowsCancelButton:NO animated:NO];

//  NSUInteger numViews = [self.subviews count];
//  for(int i = 0; i < numViews; i++) {
//    if([[[self.subviews objectAtIndex:i] subviews] isKindOfClass:[UITextField class]]) { //conform?
//      searchField = [self.subviews objectAtIndex:i];
//        
//    }
//  }
    NSArray *searchBarSubViews = [[self.subviews objectAtIndex:0] subviews];
    UITextField *search;
    for(int i =0; i<[searchBarSubViews count]; i++) {
        if([[searchBarSubViews objectAtIndex:i] isKindOfClass:[UITextField class]])
        {
            search=(UITextField*)[searchBarSubViews objectAtIndex:i];
            
            
            //            search.delegate = self.searchBar;
            
            //            [search setInputView:self.customKeyboard];
            //            [self.customKeyboard setTextView:search];
        }
    }
    if(!(search == nil)) {
        search.textColor = [self colorWithHex:0x8b909c];
        search.font = [UIFont fontWithName:@"MyriadPro-It" size:20];
        search.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        [search setBorderStyle:UITextBorderStyleNone];
        [search setBackgroundColor:[UIColor clearColor]];
        [search setRightView:nil];
        [search setBackground:nil];
        [search setFrame:CGRectMake(0, 0, 280, 44)];
        
        search.leftView  = nil;
        
    }

  [self bringSubviewToFront:search];
  [super layoutSubviews];
}

// http://stackoverflow.com/questions/1560081/how-can-i-create-a-uicolor-from-a-hex-string
- (UIColor *) colorWithHex:(int)hex {
  return [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0
                         green:((float)((hex & 0xFF00) >> 8))/255.0
                          blue:((float)(hex & 0xFF))/255.0 alpha:1.0];
}




@end





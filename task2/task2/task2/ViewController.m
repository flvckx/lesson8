//
//  ViewController.m
//  task2
//
//  Created by Anton Lookin on 12/16/15.
//  Copyright © 2015 geekub. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (nonatomic, readonly) NSString *labelText;

@end

@implementation ViewController

- (IBAction)addButtonTapped:(id)sender {
    NSMutableDictionary *attributesDictionary = [NSMutableDictionary dictionary];
    [attributesDictionary setObject:[UIFont systemFontOfSize:arc4random() % 25] forKey:NSFontAttributeName];
    [attributesDictionary setObject:[UIColor orangeColor] forKey:NSForegroundColorAttributeName];
    
    NSMutableAttributedString *newParagraph = [[NSMutableAttributedString alloc] initWithAttributedString:self.label.attributedText];
    
    NSMutableAttributedString *appending = [[NSMutableAttributedString alloc] initWithString:@"\nParagraph 3" attributes:attributesDictionary];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = arc4random() % 5;
    paragraphStyle.lineSpacing = arc4random() % 5;
    paragraphStyle.lineBreakMode = arc4random() % 5;
    
    NSRange strRange = NSMakeRange(0, newParagraph.length);
    
    [newParagraph addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:strRange];
    
    NSMutableAttributedString *labelContent = [[NSMutableAttributedString alloc]
                                               initWithAttributedString:self.label.attributedText];
    [labelContent appendAttributedString:appending];
    self.label.attributedText = labelContent;
    
}

- (IBAction)clearButtonTapped:(id)sender {
    self.label.text = @"";
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)deviceOrientationDidChangeNotification:(NSNotification*)notification {
    
    if (UIDeviceOrientationIsPortrait([[UIDevice currentDevice] orientation])) {
        NSString *substring = [[NSString alloc] init];
        
        if ([self.label.text length] >= 200) {
            substring = [self.label.text substringToIndex:199];
        } else {
            substring = self.label.text;
        }
        
        NSAttributedString *text = [[NSAttributedString alloc] initWithString:substring
                                                                                 attributes:@{NSStrikethroughStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleNone]}];
        [self.label setAttributedText:text];
    }
    
    if (UIDeviceOrientationIsLandscape([[UIDevice currentDevice] orientation])) {
        self.label.attributedText = self.label.text;
    }
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end

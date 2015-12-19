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

@end

@implementation ViewController

- (IBAction)addButtonTapped:(id)sender {
    NSMutableDictionary *attributesDictionary = [NSMutableDictionary dictionary];
    [attributesDictionary setObject:[UIFont systemFontOfSize:arc4random() % 25] forKey:NSFontAttributeName];
    
    NSAttributedString *newParagraph = [[NSMutableAttributedString alloc] initWithString:@"Paragraph 3" attributes:attributesDictionary];
    
    self.label.text = [self.label.text stringByAppendingString:newParagraph];
}

- (IBAction)clearButtonTapped:(id)sender {
    self.label.text = @"";
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end

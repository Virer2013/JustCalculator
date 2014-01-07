//
//  VIRViewController.h
//  JustCalculator
//
//  Created by Administrator on 16.12.13.
//  Copyright (c) 2013 Administrator. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VIRViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *indicatorScreen;
@property (strong, nonatomic) NSMutableArray *operands;
@property (assign, nonatomic) BOOL flagPoint;
@property (strong, nonatomic) NSString *operations;
@property (assign, nonatomic) BOOL isNegativeNumber;

@property (weak, nonatomic) IBOutlet UIButton *buttonAllClear;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttonsRounf;

- (IBAction)actionNumber:(UIButton *)sender;
- (IBAction)actionEqual:(UIButton *)sender;
- (IBAction)actionOperation:(UIButton *)sender;
- (IBAction)actionPoint:(UIButton *)sender;
- (IBAction)actionALL:(UIButton *)sender;
- (IBAction)actionNegative:(UIButton *)sender;


- (void)getOperand:(double)operand;
- (double)performCalculator:(NSString *)operation;
- (void)clearMemory;
@end

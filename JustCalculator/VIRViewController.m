//
//  VIRViewController.m
//  JustCalculator
//
//  Created by Administrator on 16.12.13.
//  Copyright (c) 2013 Administrator. All rights reserved.
//

#import "VIRViewController.h"

@interface VIRViewController ()

@end

@implementation VIRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.indicatorScreen.text = @"0";
    for(UIButton *arrayButton in self.buttonsRounf){
        arrayButton.layer.cornerRadius = 10;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSMutableArray *)operand {
    if(!self.operands) {
        self.operands = [[NSMutableArray alloc] init];
    }
    return self.operands;
}

- (void)getOperand:(double)operand {
    
    NSNumber *operandObject = [NSNumber numberWithDouble:operand];
    
   [self.operand addObject:operandObject];
}

- (double)setOperand {
    NSNumber *operandEntry = [self.operand lastObject];
    
    if(operandEntry) {
        [self.operand removeLastObject];
    }
    
    return [operandEntry doubleValue];
}

- (double)performCalculator:(NSString *)operation {
    
    double result = 0;
    
    if([self.operations isEqualToString:@"+"]) {
        result = [self setOperand] + [self setOperand];
    } else if ([self.operations isEqualToString:@"-"]) {
        double substruct = [self setOperand];
        result = [self setOperand] - substruct;
    } else if ([self.operations isEqualToString:@"*"]) {
        result = [self setOperand] * [self setOperand];
    } else if ([self.operations isEqualToString:@"/"]) {
        double devide = [self setOperand];
        result = [self setOperand] / devide;
    }
    
    [self getOperand:result];
    return result;
}

- (void)clearMemory {
    [self.operands removeAllObjects];
}

#pragma mark - Action Number
- (IBAction)actionNumber:(UIButton *)sender {
    
    NSString *currentNumber = [sender currentTitle];
    
    [self.buttonAllClear setTitle:@"C" forState:UIControlStateNormal];
    
    if([self.indicatorScreen.text isEqualToString:@"0"]) {
        
        self.indicatorScreen.text = @"";
        
        if(currentNumber == 0){
            self.indicatorScreen.text = @"0";
        }
    }
    
    if(self.flagPoint) {
        self.indicatorScreen.text = [self.indicatorScreen.text stringByAppendingString:currentNumber];
    } else {
        self.indicatorScreen.text = currentNumber;
        self.flagPoint = YES;
    }
}

- (IBAction)actionEqual:(UIButton *)sender {
    [self getOperand:[self.indicatorScreen.text doubleValue]];
    self.flagPoint = NO;
    double result = [self performCalculator:self.operations];
    self.indicatorScreen.text = [NSString stringWithFormat:@"%g", result];
}

- (IBAction)actionOperation:(UIButton *)sender {
    
    self.operations = [sender currentTitle];
    [self getOperand:[self.indicatorScreen.text doubleValue]];
    self.flagPoint = NO;
}

- (IBAction)actionPoint:(UIButton *)sender {
    
    NSRange range = [self.indicatorScreen.text rangeOfString:@"."];
    if(range.location == NSNotFound) {
        self.indicatorScreen.text = [self.indicatorScreen.text stringByAppendingString:@"."];
    }
    
    self.flagPoint = YES;
}

- (IBAction)actionALL:(UIButton *)sender {
    
    NSString *state = [sender currentTitle];
    if([state isEqualToString:@"C"]) {
        self.isNegativeNumber = NO;
        self.indicatorScreen.text = @"0";
        [self.buttonAllClear setTitle:@"AC" forState:UIControlStateNormal];
    }
    if([state isEqualToString:@"AC"]){
        self.isNegativeNumber = NO;
        [self clearMemory];
        self.indicatorScreen.text = @"0";
        self.flagPoint = NO;
    }
    
}

- (IBAction)actionNegative:(UIButton *)sender {
    
    if([self.indicatorScreen.text isEqualToString:@"0"]) {
        return;
    } else {
        NSString *neg = @"-";
        if(!self.isNegativeNumber) {
            self.isNegativeNumber = YES;
            self.indicatorScreen.text = [neg stringByAppendingFormat:self.indicatorScreen.text];
        } else {
            self.isNegativeNumber = NO;
            self.indicatorScreen.text = [self.indicatorScreen.text substringFromIndex:1];
        }
    }
}
@end

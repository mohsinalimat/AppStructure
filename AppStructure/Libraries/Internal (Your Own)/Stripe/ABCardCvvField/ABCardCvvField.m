//
//  ABCardCvvField.m
//  Lango
//
//  Created by Asif Bilal on 24/08/2016.
//  Copyright © 2016 Asif Bilal. All rights reserved.
//

#import "ABCardCvvField.h"
#import "BKMoneyUtils.h"

@interface ABCardCvvField ()

@property (nonatomic, strong) NSRegularExpression *nonNumericRegularExpression;
@property (nonatomic, strong) NSCharacterSet *numberCharacterSet;

@property (nonatomic, strong) NSString *cardType;

@end

@implementation ABCardCvvField

#define AMEX_COMPANY_NAME  @"American Express"
#define AMEX_MAX_LENGTH  4
#define OTHERS_MAX_LENGTH  3

- (void)commonInit
{
    [super commonInit];
    
    self.placeholder = @"CVV";
    self.keyboardType = UIKeyboardTypeNumberPad;
    self.clearButtonMode = UITextFieldViewModeAlways;
    
    self.cardType = @"";
    
    _numberCharacterSet = [BKMoneyUtils numberCharacterSet];
    _nonNumericRegularExpression = [BKMoneyUtils nonNumericRegularExpression];
}

- (void)dealloc
{
}

- (NSString *)numberOnlyStringWithString:(NSString *)string
{
    return [self.nonNumericRegularExpression stringByReplacingMatchesInString:string
                                                                      options:0
                                                                        range:NSMakeRange(0, string.length)
                                                                 withTemplate:@""];
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.text = [self getFormattedCVVNumber];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    self.text = [self getFormattedCVVNumber];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ([self.userDelegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]) {
        if (NO == [self.userDelegate textField:textField shouldChangeCharactersInRange:range replacementString:string]) {
            return NO;
        }
    }
    
    NSString *currentText = textField.text;
    
    NSCharacterSet *nonNumberCharacterSet = [self.numberCharacterSet invertedSet];
    
    if (string.length == 0 && [[currentText substringWithRange:range] stringByTrimmingCharactersInSet:nonNumberCharacterSet].length == 0) {
        // find non-whitespace character backward
        NSRange numberCharacterRange = [currentText rangeOfCharacterFromSet:self.numberCharacterSet
                                                                    options:NSBackwardsSearch
                                                                      range:NSMakeRange(0, range.location)];
        // adjust replace range
        if (numberCharacterRange.location != NSNotFound) {
            range = NSUnionRange(range, numberCharacterRange);
        }
    }
    
    NSString *replacedString = [currentText stringByReplacingCharactersInRange:range withString:string];
    NSString *numberOnlyString = [self numberOnlyStringWithString:replacedString];
    
    if (numberOnlyString.length >= OTHERS_MAX_LENGTH || numberOnlyString.length <= AMEX_MAX_LENGTH) {
        if ([_cardType isEqualToString:AMEX_COMPANY_NAME]) {
            return numberOnlyString.length <= AMEX_MAX_LENGTH;
        } else {
            return numberOnlyString.length <= OTHERS_MAX_LENGTH;
        }
    }
    
    
    [self sendActionsForControlEvents:UIControlEventEditingChanged];
    
    return NO;
    
}

- (void)setCardCVV:(NSString *)cardCVV
{
    self.text = [self numberOnlyStringWithString:cardCVV];
}

- (NSString *)cardCVV {
    
    return [self getFormattedCVVNumber];
}

- (void)setCardType:(NSString *)cardType
{
    _cardType = cardType;
}

- (NSString *)getFormattedCVVNumber {
    
    NSString *formattedCVVNumber = self.text;
    
    NSUInteger maxLength = 0;
    
    if ([_cardType isEqualToString:AMEX_COMPANY_NAME]) {
        maxLength = AMEX_MAX_LENGTH;
    } else {
        maxLength = OTHERS_MAX_LENGTH;
    }
    
    if (self.text.length > maxLength) {
        formattedCVVNumber =  [self.text substringToIndex:maxLength-1];
    }
    
    if (formattedCVVNumber.length == 0) {
        formattedCVVNumber = @"";
    }
    
    return formattedCVVNumber;
    
}

@end

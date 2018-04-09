//
//  ABCardCvvField.h
//  Lango
//
//  Created by Asif Bilal on 24/08/2016.
//  Copyright © 2016 Asif Bilal. All rights reserved.
//

#import <BKMoneyKit/BKForwardingTextField.h>

@interface ABCardCvvField : BKForwardingTextField

/**
 * cardCVV string.
 * Use this property to set or get cardCVV instead of text property.
 */

@property (nonatomic, readwrite) NSString* cardCVV;

- (void)setCardType:(NSString *)cardType;

@end

//
//  STKStickersPurchaseService.m
//  StickerPipe
//
//  Created by Olya Lutsyk on 2/16/16.
//  Copyright © 2016 908 Inc. All rights reserved.
//

#import "STKStickersPurchaseService.h"
#import "STKStickersManager.h"

#import <RMStore/RMStore.h>
#import "RMStoreKeychainPersistence.h"

#import "STKStickersConstants.h"

@interface STKStickersPurchaseService() <RMStoreObserver>

@property(nonatomic, strong) RMStoreKeychainPersistence *persistence;

@end

@implementation STKStickersPurchaseService

- (id)init {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    return self;
}

- (BOOL)hasInAppProductIds {
    return [STKStickersManager productIdentifiers];
}

- (void)requestProductsWithIdentifier:(NSArray *)productIds
                           completion:(void(^) (NSArray *))completion{
    NSSet *product = [NSSet setWithArray:productIds];
    [[RMStore defaultStore] requestProducts:product success:^(NSArray *products, NSArray *invalidProductIdentifiers) {
        completion(products);
        NSLog(@"Products loaded");
    } failure:^(NSError *error) {
        NSLog(@"Something went wrong");
    }];
}

- (void)purchaseProductWithIdentifier:(NSString *)productId {
    
    __weak typeof(self) wself = self;
    
    [[RMStore defaultStore] addPayment:productId success:^(SKPaymentTransaction *transaction) {
        NSLog(@"purchase complete");
        
    } failure:^(SKPaymentTransaction *transaction, NSError *error) {
        NSLog(@"purchase failed");
        [wself purchaseFailed];
    }];
    
}

#pragma mark - purchases

- (void)purchaseSucceedForPack:(NSString *)packName withPrice:(NSString *)packPrice {
    [[NSNotificationCenter defaultCenter] postNotificationName:STKPurchaseSucceededNotification object:self userInfo:@{@"packName": packName, @"packPrice": packPrice}];
}

- (void)purchaseFailed {
    [[NSNotificationCenter defaultCenter] postNotificationName:STKPurchaseFailedNotification object:self];
}

@end

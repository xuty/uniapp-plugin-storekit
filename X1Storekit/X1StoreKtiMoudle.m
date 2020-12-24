//
//  X1StoreKtiMoudle.m
//  X1Storekit
//
//  Created by X on 2020/12/23.
//

#import "X1StoreKtiMoudle.h"
#import <StoreKit/StoreKit.h>
#import "WXDefine.h"

@implementation X1StoreKtiMoudle

WX_EXPORT_METHOD(@selector(review:))

- (void)review:(NSString*)appid {
    if (@available(iOS 10.3, *)) {
        [SKStoreReviewController requestReview];
    } else {
        if ( [appid isKindOfClass:[NSString class]] && appid.length ){
            NSString *str = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/id%@?action=write-review", appid];
            NSURL *url = [NSURL URLWithString:str];
            if ( url ){
                if( [[UIApplication sharedApplication] canOpenURL:url] ){
                    [[UIApplication sharedApplication] openURL:url];
                }
            }
        }
    }
}

@end

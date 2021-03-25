#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "AmplifyDataStorePlugin.h"

FOUNDATION_EXPORT double amplify_datastoreVersionNumber;
FOUNDATION_EXPORT const unsigned char amplify_datastoreVersionString[];


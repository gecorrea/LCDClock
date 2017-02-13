//  Utilities.h
//  LCDClock

#import <Foundation/Foundation.h>

@interface Utilities : NSObject

+ (id) getPlistDictionaryObjectForKey:(NSString*) key;

+ (void)writeToPlistDictionary: (id) object forKey:(NSString*) key;

@end

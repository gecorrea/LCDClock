//  Utilities.m
//  LCDClock

#import "Utilities.h"

@implementation Utilities

+ (id) getPlistDictionaryObjectForKey:(NSString*) key {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *pListPath = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"settings.plist"];
    NSMutableDictionary *defaultsDictionary = [[NSMutableDictionary alloc]initWithContentsOfFile:pListPath];
    return [defaultsDictionary objectForKey:key];
}

+ (void)writeToPlistDictionary: (id) object forKey:(NSString*) key {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *pListPath = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"settings.plist"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    //check if dictionary exists yet with if/else
    if ([fileManager fileExistsAtPath:pListPath]){
        NSMutableDictionary *defaultsDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:pListPath];
        [defaultsDictionary setObject:object forKey:key];
        [defaultsDictionary writeToFile:pListPath atomically:YES];
    } else {
        NSMutableDictionary *defaultsDictionary = [[NSMutableDictionary alloc]init];
        [defaultsDictionary setObject:object forKey:key];
        [defaultsDictionary writeToFile:pListPath atomically:YES];
    }
    
}

@end

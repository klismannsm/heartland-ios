#import <Foundation/Foundation.h>
#import "HpsPaxDeviceResponse.h"

@interface HpsPaxTerminalStatusResponse : HpsPaxDeviceResponse
@property (nonatomic,strong) NSString *terminalStatusCode;
@property (nonatomic,strong) NSString *terminalStatus;

- (id) initWithBuffer:(NSData*)buffer;
- (HpsBinaryDataScanner*) parseResponse;

@end

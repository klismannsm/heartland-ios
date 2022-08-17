#import "HpsPaxTerminalStatusResponse.h"

@implementation HpsPaxTerminalStatusResponse
- (id) initWithBuffer:(NSData*)buffer{
    if((self = [super initWithMessageID:A35_RSP_REPORT_STATUS andBuffer:buffer]))
    {
        [self parseResponse];
    }
    return self;
    
}

- (HpsBinaryDataScanner*) parseResponse{
    HpsBinaryDataScanner *reader = [super parseResponse];
    self.terminalStatusCode = [reader readStringUntilDelimiter:HpsControlCodes_ETX];
    int statusCode = [self.terminalStatusCode intValue];
    switch(statusCode) {
        case 0:
        case 9000000:
            self.terminalStatus = @"Ready for card input";
            break;
        case 1:
        case 9000001:
            self.terminalStatus = @"Ready for PIN entry";
            break;
        case 2:
        case 9000002:
            self.terminalStatus = @"Ready for Signature";
            break;
        case 3:
        case 9000003:
            self.terminalStatus = @"Ready for Online Processing";
            break;
        case 4:
        case 9000004:
            self.terminalStatus = @"Ready for second card input (For REPLACE/MERGE)";
            break;
        case 5:
        case 9000005:
            self.terminalStatus = @"Ready for Signature retry by pressing CLEAR key";
            break;
        case 6:
        case 9000006:
            self.terminalStatus = @"Ready for PIN retry by inputting wrong offline PIN for EMV";
            break;
        case 9000007:
            self.terminalStatus = @"Please See Phone";
            break;
        case 9000008:
            self.terminalStatus = @"Please Try Another Card";
        break;
        case 9000009:
            self.terminalStatus = @"Please Present One Card Only";
        break;
        case 9000010:
            self.terminalStatus = @"Fallback Swipe";
        break;
        case 9020002:
            self.terminalStatus = @"Ready for entering cashback";
        break;
        case 9040003:
            self.terminalStatus = @"Remove Card";
        break;
        case 9040010:
            self.terminalStatus = @"Re-Insert Card";
        break;
        default:
            self.terminalStatus = @"Unknown status";
        break;
    }

    return reader;
    
}

@end

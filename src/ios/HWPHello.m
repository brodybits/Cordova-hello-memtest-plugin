#import "HWPHello.h"

@implementation HWPHello

- (void)greet:(CDVInvokedUrlCommand*)command
{

    NSString* callbackId = [command callbackId];
    NSString* name = [[command arguments] objectAtIndex:0];
    NSString* msg = [NSString stringWithFormat: @"Hello, %@", name];

    //NSMutableArray *results = [NSMutableArray arrayWithCapacity:0];

    NSMutableDictionary *resultSet = [NSMutableDictionary dictionaryWithCapacity:0];
    NSMutableArray *resultRows = [NSMutableArray arrayWithCapacity:0];
    NSMutableDictionary *entry;
    NSObject *columnValue;
    NSString *columnName;

    int i,j;
    for (i=1; i<=20; ++i) {
      entry = [NSMutableDictionary dictionaryWithCapacity:0];

      for (j=1; j<=30; ++j) {
        columnName = [NSString stringWithFormat:@"text%d", j];
        columnValue = [NSString stringWithFormat:@"teststringteststring-%d-%d", i, j];
        [entry setObject:columnValue forKey:columnName];
      }

      for (j=1; j<=10; ++j) {
        columnName = [NSString stringWithFormat:@"int%d", j];
        columnValue = [NSNumber numberWithDouble: i*100 + j];
        [entry setObject:columnValue forKey:columnName];
      }

      for (j=1; j<=10; ++j) {
        columnName = [NSString stringWithFormat:@"float%d", j];
        columnValue = [NSNumber numberWithFloat: i*101.11 + j*1.101];
        [entry setObject:columnValue forKey:columnName];
      }

      for (j=1; j<=10; ++j) {
        columnName = [NSString stringWithFormat:@"null%d", j];
        columnValue = [NSNull null];
        [entry setObject:columnValue forKey:columnName];
      }

      [resultRows addObject:entry];
    }

    [resultSet setObject:resultRows forKey:@"rows"];
    [resultSet setObject:[NSNumber numberWithInt:0] forKey:@"rowsAffected"];


    CDVPluginResult* result = [CDVPluginResult
                               resultWithStatus:CDVCommandStatus_OK
                               messageAsDictionary:resultSet];

    //[self success:result callbackId:callbackId];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

@end

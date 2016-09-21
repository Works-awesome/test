//
//  ReadFile.m
//  AGGraph
//
//  Created by Arjun Hanswal on 9/7/16.
//  Copyright © 2016 Autogenomics. All rights reserved.
//

#import "ReadFile.h"
#define R_PATH              "/Library/Application Support/AutoGenomics/"
@implementation ReadFile
{
    NSMutableArray *graphData;
}
-(instancetype)init
{
    graphData = [[NSMutableArray alloc] init];
    return self;

}
- (NSArray *)readTemperatureFiles
{
    int i;
    char OutputFile[512];
    //    char OutputFile[512];
    FILE *fp;
    NSString *fileName;
    
    sprintf(OutputFile, "%sSampleTemperature.txt", R_PATH);
    fp = fopen(OutputFile, "w");
    if(fp == NULL)
    {
        NSLog(@"Unable to create SampleTemperature.txt file.");
        AGRunAlertPanels(@"Unable to create SampleTemperature.txt file.", @"", @"OK", nil, nil);
        return graphData;
    }
    
    fileName = [NSString stringWithFormat:@"%stemperature.txt", R_PATH];
    // read everything from text
    NSString* fileContents =
    [NSString stringWithContentsOfFile:fileName
                              encoding:NSUTF8StringEncoding error:nil];
    
    // first, separate by new line
    NSArray* allLinedStrings =
    [fileContents componentsSeparatedByCharactersInSet:
     [NSCharacterSet newlineCharacterSet]];
    
    for(i = 0; i < [allLinedStrings count]; i++)
    {
        // then break down even further
        NSString* strsInOneLine =
        [allLinedStrings objectAtIndex:i];
        
        if([strsInOneLine isEqualToString:@""])
            continue;
        
        char test = [strsInOneLine characterAtIndex:0];
        if (!(test >= '0' && test <= '9'))
            continue;
        
        // choose whatever input identity you have decided. in this case ;
        NSArray* singleStrs = [strsInOneLine componentsSeparatedByCharactersInSet:
                               [NSCharacterSet characterSetWithCharactersInString:@"\t"]];
        
        if([singleStrs count] < 2)
        {
            NSLog(@"Invalid temperature file. Please use correct input file.");
            AGRunAlertPanels(@"Invalid temperature file.", @"Please use correct temperature file.", @"OK", nil, nil);
            fclose(fp);
            return nil;
        }
    
             [graphData addObject:[singleStrs objectAtIndex:1]];
        
       
        
        fprintf(fp, "%s\n", [[singleStrs objectAtIndex:1] UTF8String]);
    }
    
    AGRunAlertPanels(@"Successfully created SampleTemperature.txt file.", @"", @"OK", nil, nil);
    
    fclose(fp);
    return graphData;
}

int AGRunAlertPanels(NSString *title, NSString *informativeText, NSString *btn1Title, NSString *btn2Title, NSString *btn3Title)
{

    int rCode = 0;
    
    return rCode;
}

@end

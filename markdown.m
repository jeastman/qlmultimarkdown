#include "markdown.h"

NSData* renderMarkdown(NSURL* url)
{
	
	NSString *path2MMD = @"/usr/local/bin/multimarkdown";


	NSLog(@"launching %@", [path2MMD stringByExpandingTildeInPath]);
	NSTask* task = [[NSTask alloc] init];
	[task setLaunchPath: [path2MMD stringByExpandingTildeInPath]];
	[task setArguments: [NSArray arrayWithObjects: nil]];
	
	NSPipe *writePipe = [NSPipe pipe];
	NSFileHandle *writeHandle = [writePipe fileHandleForWriting];
	[task setStandardInput: writePipe];
	
	NSPipe *readPipe = [NSPipe pipe];
	[task setStandardOutput:readPipe];
	
	[task launch];
	
	NSString *theData = [NSString stringWithContentsOfFile:[url path] encoding:NSUTF8StringEncoding error:nil];

	[writeHandle writeData:[theData dataUsingEncoding:NSUTF8StringEncoding]];
	[writeHandle closeFile];
	
	
	NSData *mdData = [[readPipe fileHandleForReading] readDataToEndOfFile];

	NSString* aStr;
	aStr = [[NSString alloc] initWithData:mdData encoding:NSASCIIStringEncoding];

	NSLog(@"results:\n%@",aStr);
	
	return mdData;
	
	//return [[readPipe fileHandleForReading] readDataToEndOfFile];
	
	/*
    NSString *styles = [NSString stringWithContentsOfFile:[[NSBundle bundleWithIdentifier: @"com.fiatdev.QLMarkdown"]
                                                           pathForResource:@"styles" ofType:@"css"]
                                                 encoding:NSUTF8StringEncoding
                                                    error:nil];
    
    NSStringEncoding usedEncoding = 0;
    NSError *e = nil;
    
    NSString *source = [NSString stringWithContentsOfURL:url usedEncoding:&usedEncoding error:&e];
    
    if (usedEncoding == 0) {
        NSLog(@"Wasn't able to determine encoding for file “%@”", [url path]);
    }

    char *output = convert_markdown_to_string([source UTF8String]);
    NSString *html = [NSString stringWithFormat:@"<html>"
                                                 "<head>"
                                                 "<meta content='text/html; charset=UTF-8' http-equiv='Content-Type' />"
                                                 "<style type=\"text/css\">%@</style>"
                                                 "</head>"
                                                 "<body>%@</body>"
                                                 "</html>", 
                                                 styles, [NSString stringWithUTF8String:output]];
    
    free(output);
    return [html dataUsingEncoding:NSUTF8StringEncoding];*/
}

/*

 old version for MD.pl

NSTask* task = [[NSTask alloc] init];
[task setLaunchPath: [[NSBundle bundleWithIdentifier: @"com.fiatdev.QLMarkdown"] pathForResource: @"Markdown" ofType: @"pl"]];
[task setArguments: [NSArray arrayWithObjects: [url path], nil]];

NSPipe* pipe = [NSPipe pipe];
[task setStandardOutput: pipe];

[task launch];

return [[pipe fileHandleForReading] readDataToEndOfFile];

*/

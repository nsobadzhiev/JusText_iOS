//
//  JusText.m
//  JusText
//
//  Created by Nikola Sobadjiev on 1/23/15.
//  Copyright (c) 2015 Nikola Sobadjiev. All rights reserved.
//

#import "TextExractor.h"
#include "justext.h"
#include <sstream>

@interface TextExractor ()
{
    Justext* justText;
}

@end

@implementation TextExractor

- (instancetype)initWithHtml:(NSString*)htmlString
{
    self = [self initWithHtml:htmlString stopWordsFile:@"stoplists/English.txt"];
    return self;
}

- (instancetype)initWithHtml:(NSString*)htmlString
               stopWordsFile:(NSString*)stopWordsPath
{
    self = [super init];
    if (self)
    {
        const char* stopWordsCString = [stopWordsPath cStringUsingEncoding:NSUTF8StringEncoding];
        std::string stopWords = std::string(stopWordsCString);
        justText = new Justext(stopWords);
        justText->setDebug(false);
        self.htmlText = htmlString;
    }
    return self;
}

- (void)dealloc
{
    delete justText;
}

- (NSString*)extractedText
{
    const char* htmlCString = [self.htmlText cStringUsingEncoding:NSUTF8StringEncoding];
    std::string htmlStdString = std::string(htmlCString);
    std::string htmlEncoding = std::string("UTF-8");
    std::string htmlUrl = std::string("");
    std::string resultText = justText->getContent(htmlStdString, htmlEncoding, htmlUrl);
    NSString *extractedText = [NSString stringWithCString:resultText.c_str() 
                                                 encoding:NSUTF8StringEncoding];
    return extractedText;
}

@end

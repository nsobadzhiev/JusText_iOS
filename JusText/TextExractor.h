//
//  JusText.h
//  JusText
//
//  Created by Nikola Sobadjiev on 1/23/15.
//  Copyright (c) 2015 Nikola Sobadjiev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TextExractor : NSObject
{

}

- (instancetype)initWithHtml:(NSString*)htmlString;
- (instancetype)initWithHtml:(NSString*)htmlString
               stopWordsFile:(NSString*)stopWordsPath;

@property (nonatomic, readonly) NSString* extractedText;
@property (nonatomic, strong) NSString* htmlText;

@end

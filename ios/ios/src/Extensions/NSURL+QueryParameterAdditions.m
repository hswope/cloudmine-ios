//
//  NSURL+QueryParameterAdditions.m
//  cloudmine-ios
//
//  Copyright (c) 2012 CloudMine, LLC. All rights reserved.
//  See LICENSE file included with SDK for details.
//

#import "SPLowVerbosity.h"
#import "NSURL+QueryParameterAdditions.h"

@implementation NSURL (QueryParameterAdditions)


-(NSURL *)URLByAppendingAndEncodingQueryParameter:(NSString *)key andValue:(NSString *)value
{
    // check parameters
    assert(key && value && [key length]);
    if (!key || !value || ![key length])
    {
        return [self copy];
    }

    NSMutableString * newUrl = [[NSMutableString alloc]init];
    [newUrl setString:$sprintf(@"%@://%@/%@?",[self scheme],[self host],[self path])];
    [newUrl appendString:[self appendAndEncodeParameter:[self query] withKey:key andWithValue:value]];

    return [NSURL URLWithString:newUrl];
}

-(NSURL *)URLByAppendingAndEncodingQueryParameters:(NSDictionary *)queryParameters
{
    assert(queryParameters);
    if (!queryParameters)
    {
        return [self copy];
    }

    NSMutableString * newUrl = [[NSMutableString alloc]init];
    [newUrl setString:$sprintf(@"%@://%@/%@?",[self scheme],[self host],[self path])];

    NSMutableString * newQuery = [[NSMutableString alloc]init];
    if ([self query])
    {
        [newQuery setString:[self query]];
    }
    for (id key in queryParameters)
    {
        [newQuery setString:[self appendAndEncodeParameter: newQuery withKey: key andWithValue: [queryParameters objectForKey:key]]];
    }

    [newUrl appendString:newQuery];
    return [NSURL URLWithString:newUrl];
}

-(NSString *) appendAndEncodeParameter: (NSString *)queryString withKey: (NSString *)key andWithValue: (NSString *)value
{
    if (!queryString || ![queryString length])
    {
        return $sprintf(@"%@=%@",key, $urlencode(value));
    }
    else
    {
        return $sprintf(@"%@&%@=%@", queryString, key, $urlencode(value));
    }
}

-(NSURL *)URLByAppendingQueryString:(NSString *)queryString
{
    if (!queryString || ![queryString length])
    {
        return [self copy];
    }
    else
    {
        NSString * url = $sprintf(@"%@%@%@", [self absoluteString], [self query] ? @"&" : @"?", queryString);
        return [NSURL URLWithString:url];
    }
}
@end

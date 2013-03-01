#import "TBXML+NSDictionary.h"

@implementation TBXML (TBXML_NSDictionary)
+ (NSDictionary*)dictionaryWithXMLNode:(TBXMLElement*)element
{
    NSMutableDictionary *elementDict = [[NSMutableDictionary alloc] init];
    
    TBXMLAttribute *attribute = element->firstAttribute;
    while (attribute) {
        [elementDict setObject:[TBXML attributeValue:attribute] forKey:[TBXML attributeName:attribute]];
        attribute = attribute->next;
    }
    
    TBXMLElement *childElement = element->firstChild;
    if (childElement) {
        
        while (childElement) {
            
            if ([elementDict objectForKey:[TBXML elementName:childElement]] == nil) {
                
                [elementDict addEntriesFromDictionary:[self dictionaryWithXMLNode:childElement]];
                
            } else if ([[elementDict objectForKey:[TBXML elementName:childElement]] isKindOfClass:[NSArray class]]) {
                
                NSMutableArray *items = [[NSMutableArray alloc] initWithArray:[elementDict objectForKey:[TBXML elementName:childElement]]];
                [items addObject:[[self dictionaryWithXMLNode:childElement] objectForKey:[TBXML elementName:childElement]]];
                [elementDict setObject:[NSArray arrayWithArray:items] forKey:[TBXML elementName:childElement]];
                [items release]; items = nil;
                
            } else {
                
                NSMutableArray *items = [[NSMutableArray alloc] init];
                [items addObject:[elementDict objectForKey:[TBXML elementName:childElement]]];
                [items addObject:[[self dictionaryWithXMLNode:childElement] objectForKey:[TBXML elementName:childElement]]];
                [elementDict setObject:[NSArray arrayWithArray:items] forKey:[TBXML elementName:childElement]];
                [items release]; items = nil;
            }
            
            childElement = childElement->nextSibling;
        }
        
    } else if ([TBXML textForElement:element] != nil && [TBXML textForElement:element].length>0) {
        
        if ([elementDict count]>0) {
            [elementDict setObject:[TBXML textForElement:element] forKey:@"text"];
        } else {
            [elementDict setObject:[TBXML textForElement:element] forKey:[TBXML elementName:element]];
        }
    }
    
    
    NSDictionary *resultDict = nil;
    
    if ([elementDict count]>0) {
        
        if ([elementDict valueForKey:[TBXML elementName:element]] == nil) {
            resultDict = [NSDictionary dictionaryWithObject:elementDict forKey:[TBXML elementName:element]];
        } else {
            resultDict = [NSDictionary dictionaryWithDictionary:elementDict];
        }
    }
    
    [elementDict release]; elementDict = nil;
    
    return resultDict;
}


+ (NSDictionary*)dictionaryWithXMLData:(NSData*)data error:(NSError**)err
{
    if (data == nil) return nil;
    
    TBXML *tbxml = [TBXML tbxmlWithXMLData:data error:err];
    if (tbxml == nil || !tbxml.rootXMLElement) {
        return nil;
    }
    return [self dictionaryWithXMLNode:tbxml.rootXMLElement];
}
@end
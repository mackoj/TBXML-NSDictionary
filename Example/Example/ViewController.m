//
//  ViewController.m
//  Example
//
//  Created by Jeffrey MACKO on 01/03/13.
//  Copyright (c) 2013 macko.fr. All rights reserved.
//

#import "ViewController.h"
#import "TBXML+NSDictionary.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSData *xmlData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"books" ofType:@"xml"]];
    NSError *error = nil;
    NSDictionary *dict = [TBXML dictionaryWithXMLData:xmlData error:&error];
    NSLog(@"%@", error);
    NSLog(@"---");
    NSLog(@"%@", dict);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

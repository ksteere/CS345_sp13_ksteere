/**
 @file MatchTest.m
 */

// Test support
#import <SenTestingKit/SenTestingKit.h>

// Comment the next two lines to disable OCHamcrest (for test assertions)
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

// Comment the next two lines to disable OCMockito (for mock objects)
#define MOCKITO_SHORTHAND
#import <OCMockito/OCMockito.h>

/**
 @brief For testing Hamcrest Matchers
 */
@interface MatchTest : SenTestCase
@end

@implementation MatchTest
{
    // test fixture ivars go here
    id<HCMatcher> _case1match;
    id<HCMatcher> _case2match;
    id<HCMatcher> _case3match;
    id<HCMatcher> _case4match;
    NSArray* anArray;
    
}

- (void)setUp
{
    [super setUp];
    anArray = nil;
    _case1match = equalToIgnoringCase(@"HellO, World");       //REPLACE WITH YOUR OWN MATCHER
    _case2match = hasCount(isNot(@10)); //REPLACE WITH YOUR OWN MATCHER
    _case3match = onlyContains(stringContainsInOrder(@"e", @"a", @"o", nil), nil);          //REPLACE WITH YOUR OWN MATCHER
    _case4match = isNot(nil);      //REPLACE WITH YOUR OWN MATCHER
}

//Case 1

- (void)testCase1PositiveA { assertThat(@"HellO, World", is(_case1match)); }
- (void)testCase1PositiveB { assertThat(@"HELLO, WORLD", is(_case1match)); }
- (void)testCase1PositiveC { assertThat(@"hello, world", is(_case1match)); }
- (void)testCase1PositiveD { assertThat(@"HeLlO, wOrLd", is(_case1match)); }

- (void)testCase1NegativeA { assertThat(@"Hello,  world", isNot(_case1match)); }
- (void)testCase1NegativeB { assertThat(@"hello", isNot(_case1match)); }
- (void)testCase1NegativeC { assertThat(@"world", isNot(_case1match)); }

//Case 2

- (void)testCase2PositiveA { anArray = @[ @1, @2, @3, @4, @5 ];
    assertThat(anArray, is(_case2match)); }
- (void)testCase2PositiveB { anArray = @[ @"this", @"that", @"other"];
    assertThat(anArray, is(_case2match)); }
- (void)testCase2PositiveC { anArray = @[ @3, @1, @4, @1, @5, @9, @2, @6, @5 ];
    assertThat(anArray, is(_case2match)); }

- (void)testCase2NegativeA { anArray = @[ @1, @2, @3, @4, @5, @6, @7, @8, @9, @10 ];
    assertThat(anArray, isNot(_case2match)); }
- (void)testCase2NegativeB { anArray = @[ @"only", @"thoughts", @"thrive", @"from", @"friend", @"summer", @"season", @"elephant", @"nose", @"toes"];
    assertThat(anArray, isNot(_case2match)); }
- (void)testCase2NegativeC { anArray = @[ @3, @1, @4, @1, @5, @9, @2, @6, @5, @3, @5, @8, @9, @7, @9 ];
    assertThat(anArray, isNot(_case2match)); }

//Case 3

- (void)testCase3PositiveA { anArray = @[ @"the lazy sleeping dog" ];
    assertThat(anArray, is(_case3match)); }
- (void)testCase3PositiveB { anArray = @[ @"the lazy dogs" ];
    assertThat(anArray, is(_case3match)); }
- (void)testCase3PositiveC { anArray = @[ @"hear oh", @"ear no", @"bear slow" ];
    assertThat(anArray, is(_case3match)); }
- (void)testCase3PositiveD { anArray = @[ @"dear oh dear" ];
    assertThat(anArray, is(_case3match)); }

- (void)testCase3NegativeA { anArray = @[ @"this lazy dog" ];
    assertThat(anArray, isNot(_case3match)); }
- (void)testCase3NegativeB { anArray = @[ @"oh dear", @"hear oh", @"ear no" ];
    assertThat(anArray, isNot(_case3match)); }
- (void)testCase3NegativeC { anArray = @[ @"no fear" ];
    assertThat(anArray, isNot(_case3match)); }
- (void)testCase3NegativeD { anArray = @[ @"free beer" ];
    assertThat(anArray, isNot(_case3match)); }

//Case 4

- (void)testCase4PositiveA { anArray = @[ @42 ];
    assertThat(anArray, is(_case4match)); }
- (void)testCase4PositiveB { anArray = @[ @19, @83, @41, @99 ];
    assertThat(anArray, is(_case4match)); }
- (void)testCase4PositiveC { anArray = @[ @43, @44, @45, @46 ];
    assertThat(anArray, is(_case4match)); }

- (void)testCase4NegativeA { anArray = @[ @9, @90 ];
    assertThat(anArray, isNot(_case4match)); }
- (void)testCase4NegativeB { anArray = @[ @3, @4, @5, @6 ];
    assertThat(anArray, isNot(_case4match)); }
- (void)testCase4NegativeC { anArray = @[ @0 ];
    assertThat(anArray, isNot(_case4match)); }
- (void)testCase4NegativeD { anArray = @[ @35, @40, @45, @50 ];
    assertThat(anArray, isNot(_case4match)); }





@end

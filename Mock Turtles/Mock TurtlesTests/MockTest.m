/**
 @file MockTest.m
 @brief Part of Mock Turtles
 @author Bryant Adams
 @date 2/5/13
 @copyright GNU Public License v3 or later, 2013
 @version <#VERSION-NUMBER#>
*/

    // Class under test
//#import "<#Class Header#>"

    // Collaborators

    // Test support
#import <SenTestingKit/SenTestingKit.h>

// Comment the next two lines to disable OCHamcrest (for test assertions)
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

// Comment the next two lines to disable OCMockito (for mock objects)
#define MOCKITO_SHORTHAND
#import <OCMockito/OCMockito.h>

/**
 @brief For testing Mocking
 */
@interface MockTest : SenTestCase
@end

@implementation MockTest
{
    NSDictionary* sut;
}

- (void)setUp
{
    [super setUp];
    sut = mock([NSArray class]);
}

- (void)tearDown
{
    sut = nil;
    [super tearDown];
}

- (void)testStubbedValueForKey
{
    // given
    //TODO: Prepare our S.U.T. to return 'Bouffant' as the value for 'Bulbous'

    // when
    id value = [sut valueForKey:@"Bulbous"];
    
    // then
    assertThat(value, is(equalToIgnoringCase(@"Bouffant")));
}

- (void)testMessageReceipt
{
    // given
    NSSet* bunchaStuff = [NSSet setWithObjects:sut, nil];
    
    // when
    for(NSMutableDictionary* element in bunchaStuff)
    {
        [element setValue:@"Lubber" forKey:@"Acadamia"];
//        [element setValue:@"Blubber" forKey:@"Macadamia"]; //Should fail when this line is commented out, pass when it's not
    }

    // then
    // TODO: Verify that our S.U.T. had a -setValue:forKey: message sent to it
}

-(void)testWhenStage
{
    //when
    //TODO: Write code which will send the expected messages to the S.U.T.

    //then
    [verifyCount(sut, atLeast(2)) valueForKey:(id) startsWith(@"We")];
    [verifyCount(sut, never()) valueForKey:(id) startsWith(@"Wel")];
}


@end

#import "DMBRootViewController.h"

@interface DMBRootViewController ()
@property (nonatomic, strong) NSMutableArray * objects;
@end

@implementation DMBRootViewController

- (void)loadView {
	[super loadView];

	_objects = [NSMutableArray array];
	self.title = @"Du2s";
	UILabel * myLabel = [[UILabel alloc] 
		initWithFrame: CGRectMake(100,100,200,200)];
	myLabel.text = [self getDateString];
	[myLabel setBackgroundColor: [UIColor clearColor]];
	myLabel.textColor = [UIColor redColor];
	[self.view addSubview:myLabel];
}
- (NSString*) getDateString {
	NSDate * now = [NSDate date];
	NSLog(@"%f", 0.6);
	NSDateFormatter *armyDaysFormat = [[NSDateFormatter alloc] init];
	[armyDaysFormat setDateFormat:@"yyyy-MM-ddHH:mm:ss"];
	NSDate * startDate = [armyDaysFormat dateFromString: 
					    @"2022-11-21 00:00:00"];
	//NSDate * now = [armyDaysFormat dateFromString:
	//				    @"2023-11-21 00:00:00"];
	NSCalendar * gregorianCalendar = [[NSCalendar alloc]
		initWithCalendarIdentifier:NSGregorianCalendar];
	//NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
	NSDateComponents * armyDaysComponents = [gregorianCalendar components:NSCalendarUnitDay
	//NSDateComponents * armyDaysComponents = [gregorianCalendar components:unitFlags
	     fromDate:startDate
		  toDate: now
		 options:0];
	return [[NSString alloc] initWithFormat: @"%ld",
	       365 - (long)armyDaysComponents.day];
}
@end

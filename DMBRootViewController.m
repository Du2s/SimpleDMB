#import "DMBRootViewController.h"
#import "DMBSolder.h"

@interface DMBRootViewController ()
@property (nonatomic, strong) NSMutableArray * objects;
@end

@implementation DMBRootViewController

- (void)loadView {
	[super loadView];

	_objects = [NSMutableArray array];
	DMBSolder * SolderObj = [[DMBSolder alloc] 
		initWithString:@"Du2s" 
		startDateString:@"2022-11-21 00:00:00"];
	self.title = SolderObj.name;
	UILabel * myLabel = [[UILabel alloc] 
		initWithFrame: CGRectMake(100,100,200,200)];
	myLabel.text = [SolderObj getDaysAsString];
	[myLabel setBackgroundColor: [UIColor clearColor]];
	myLabel.textColor = [UIColor redColor];
	[self.view addSubview:myLabel];
}
@end

@implementation DMBSolder 
	-(DMBSolder *) initWithString: (NSString *) solderName 
		     startDateString:(NSString *) startDateString{
		self = [super init];
		self.name = solderName;
		NSDateFormatter *armyDaysFormat = [[NSDateFormatter alloc] init];
		[armyDaysFormat setDateFormat:@"yyyy-MM-ddHH:mm:ss"];
		self.startDate = [armyDaysFormat dateFromString: startDateString];
		return self;
	}
	-(void) countDays{
		self.todayDate = [NSDate date];
		NSCalendar * gregorianCalendar = [[NSCalendar alloc]
			initWithCalendarIdentifier:NSGregorianCalendar];
		NSDateComponents * armyDaysComponents = [gregorianCalendar
		       		components:NSCalendarUnitDay
				fromDate:self.startDate
		  		toDate: self.todayDate
		 		options:0];
		self.remainDays = [NSNumber 
			numberWithInt: 365 - armyDaysComponents.day];
	}
	-(int) getDaysAsInt{
		[self countDays];
		return [self.remainDays intValue];
	}
	-(NSString *) getDaysAsString{
		[self countDays];
		return  [[NSString alloc] 
			initWithFormat:	@"%d", [self.remainDays intValue]];
	}
@end

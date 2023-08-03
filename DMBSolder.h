@interface DMBSolder : NSObject
	@property (nonatomic, strong) NSString * name;
	@property (nonatomic, strong) NSDate * startDate;
	@property (nonatomic, strong) NSDate * todayDate;
	@property (nonatomic, strong) NSNumber * remainDays;
	-(DMBSolder *) initWithString:(NSString *) solderName 
		      startDateString:(NSString *) startDateString;
	-(void) countDays;
	-(int) getDaysAsInt;
	-(NSString *) getDaysAsString;
@end

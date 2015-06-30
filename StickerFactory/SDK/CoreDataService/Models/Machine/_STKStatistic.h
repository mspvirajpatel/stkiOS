// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to STKStatistic.h instead.

#import <CoreData/CoreData.h>

extern const struct STKStatisticAttributes {
	__unsafe_unretained NSString *action;
	__unsafe_unretained NSString *category;
	__unsafe_unretained NSString *label;
	__unsafe_unretained NSString *time;
	__unsafe_unretained NSString *value;
} STKStatisticAttributes;

@interface STKStatisticID : NSManagedObjectID {}
@end

@interface _STKStatistic : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) STKStatisticID* objectID;

@property (nonatomic, strong) NSString* action;

//- (BOOL)validateAction:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* category;

//- (BOOL)validateCategory:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* label;

//- (BOOL)validateLabel:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* time;

//- (BOOL)validateTime:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* value;

@property (atomic) int16_t valueValue;
- (int16_t)valueValue;
- (void)setValueValue:(int16_t)value_;

//- (BOOL)validateValue:(id*)value_ error:(NSError**)error_;

@end

@interface _STKStatistic (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveAction;
- (void)setPrimitiveAction:(NSString*)value;

- (NSString*)primitiveCategory;
- (void)setPrimitiveCategory:(NSString*)value;

- (NSString*)primitiveLabel;
- (void)setPrimitiveLabel:(NSString*)value;

- (NSDate*)primitiveTime;
- (void)setPrimitiveTime:(NSDate*)value;

- (NSNumber*)primitiveValue;
- (void)setPrimitiveValue:(NSNumber*)value;

- (int16_t)primitiveValueValue;
- (void)setPrimitiveValueValue:(int16_t)value_;

@end

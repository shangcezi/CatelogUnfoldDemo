//
//  ViewController.m
//  CatelogUnfoldDemo
//
//  Created by Mac on 2019/1/8.
//  Copyright © 2019年 iMac. All rights reserved.
//

#import "ViewController.h"
#import "ExpandCell.h"
#import <objc/runtime.h>

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataArray;
@property (readwrite,strong, nonatomic) NSString *sString;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
  
    self.sString = @"77777";
    
    [self addObserver:self forKeyPath:@"sString" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
   
    
    
    self.sString = @"2222";
    
    
    _dataArray = [NSMutableArray array];
    
    NSArray *array =@[@[@[@1,@2,@3,@4],@[@5,@6,@7,@8],@[@9,@10,@11,@12]],@[@[@11,@22,@33,@44],@[@55,@66,@77,@88],@[@99,@110,@111,@112]],@[@[@"aa",@"bb",@"cc",@"dd"],@[@"ff",@"gg",@"hh",@"jj"],@[@"yy",@"uu",@"ii",@"wetwetweddd"]]];

    [_dataArray addObjectsFromArray:array];

    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 50, self.view.bounds.size.width, self.view.bounds.size.height -50) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.estimatedRowHeight = 80;
    _tableView.rowHeight = UITableViewAutomaticDimension;
    [self.view addSubview:_tableView];
    
    uint propertyCount;
    objc_property_t *ps = class_copyPropertyList([self class], &propertyCount);
    NSMutableArray* results1 = [NSMutableArray arrayWithCapacity:propertyCount];
    NSMutableArray* resulets2 = [NSMutableArray arrayWithCapacity:propertyCount];
    for (uint i = 0; i < propertyCount; i++) {
        objc_property_t property = ps[i];
        const char *propertyName = property_getName(property);
        const char *propertyAttributes = property_getAttributes(property);
        
//        NSString* type = [NSString stringWithUTF8String:propertyAttributes];
//        type = [type componentsSeparatedByString:@"\""][1];
//
//        [results addObject:@{@"name":[NSString stringWithFormat:@"%s",propertyName], @"type":type}];
        [results1 addObject:[NSString stringWithUTF8String:propertyName]];
        [resulets2 addObject:[NSString stringWithUTF8String:propertyAttributes]];
    }
 
    NSLog(@"result1 --->%@  result2 ---->%@",results1,resulets2);
    
    
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    NSLog(@"%@对象的%@属性改变了，change字典为：%@",object,keyPath,change);
    NSLog(@"属性新值为：%@",change[NSKeyValueChangeNewKey]);
    NSLog(@"属性旧值为：%@",change[NSKeyValueChangeOldKey]);
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _dataArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   NSArray *tempArray = _dataArray[section];
    return tempArray.count;
}


-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [NSString stringWithFormat:@"这是第%ld行标题",section];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   // UITableViewCell *cell = [UITableViewCell new];
     NSArray *tempArray = _dataArray[indexPath.section];
    
//    NSString *sring = [tempArray componentsJoinedByString:@","];
//    NSLog(@"index ---.%@",indexPath);
//
//    NSLog(@"tempArray--->%@",tempArray[indexPath.row]);
//
//    cell.textLabel.text = [NSString stringWithFormat:@"---->%@",sring];
    
    
    
    ExpandCell *cell = [ExpandCell cellWithTable:tableView];
    
    cell.indexPath = indexPath;
    
    cell.expandArray = tempArray[indexPath.row];
    
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSMutableArray *tempArray = _dataArray[indexPath.section];
    
   //  NSArray *tempArray = _dataArray[indexPath.section];
    
    NSArray *array = tempArray[indexPath.row];
    
    return 45*array.count +18;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 25;
}

@end

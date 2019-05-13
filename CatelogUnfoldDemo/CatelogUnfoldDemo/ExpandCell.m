//
//  ExpandCell.m
//  CatelogUnfoldDemo
//
//  Created by Mac on 2019/1/8.
//  Copyright © 2019年 iMac. All rights reserved.
//


#define RGB(__R__, __G__, __B__) [UIColor colorWithRed:(__R__)/255.0 green:(__G__)/255.0 blue:(__B__)/255.0 alpha:1.0]
#define RandColor           RGB(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))
#define DefaultCellHeight  45
#import "Masonry/Masonry.h"

#import "ExpandCell.h"
#import "DefaultCell.h"

@interface ExpandCell ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation ExpandCell

- (void)awakeFromNib {
    
    [super awakeFromNib];

}


+(instancetype)cellWithTable:(UITableView *)tableView{
//    static NSString *cellID = @"ExpandCell";
//    ExpandCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
//    if (cell == nil) {
//
//        cell = [[ExpandCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
//        //cell.backgroundColor = RandColor;
//    }
//    return cell;
    
    ExpandCell *cell = [ExpandCell new];
    
    return cell;
    
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupViews];
    }
    return self;
}


-(void)setupViews{
    
    _tableView = [[UITableView alloc]init];
    _tableView.frame = CGRectMake(0, 0, self.bounds.size.width, 100);
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.estimatedRowHeight = 60;
    _tableView.rowHeight = UITableViewAutomaticDimension;
    _tableView.scrollEnabled = NO;
    
    [self addSubview:_tableView];
  
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _expandArray.count;
    
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"标题头";
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    static NSString *cellID = @"21121221";
//
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
//        cell.textLabel.text =[NSString stringWithFormat:@"这事%@ 个数字",_expandArray[indexPath.row]];
//    }
//
//    //[NSString stringWithFormat:@"cellID - %ld",_indexPath.section];
//
//
//  //  UITableViewCell *cell = [UITableViewCell new];
//   // cell.textLabel.textColor = RandColor;
//
//    NSLog(@"aiyaya   %@ - %ld ----%@ &&-%@",self.indexPath,indexPath.row,_expandArray[indexPath.row],[NSThread currentThread]);
//
//    return cell;
    
    
    DefaultCell *cell = [DefaultCell cellWithTableView:tableView];
    cell.textString = [NSString stringWithFormat:@"这事%@ 个数字",_expandArray[indexPath.row]];
    return cell;
    
    
//
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return DefaultCellHeight;
    
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"indexPaht ---->%@",indexPath);
}

////加载完,计算tableView的高度
-(void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([indexPath row] == ((NSIndexPath*)[[tableView indexPathsForVisibleRows]lastObject]).row){
        //end of loading
        dispatch_async(dispatch_get_main_queue(), ^{
            self->_tableView.frame = CGRectMake(0, 0, self.bounds.size.width, self->_expandArray.count * DefaultCellHeight+18);
        });
    }
}


@end

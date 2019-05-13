//
//  DefaultCell.m
//  CatelogUnfoldDemo
//
//  Created by Mac on 2019/1/11.
//  Copyright © 2019年 iMac. All rights reserved.
//

#import "DefaultCell.h"
#import "Masonry/Masonry.h"

@interface DefaultCell ()
@property (strong, nonatomic) UILabel *label;

@end

@implementation DefaultCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


+(instancetype)cellWithTableView:(UITableView *)tableView{
//    static NSString *cellID =@"DefaultCell";
//    DefaultCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
//    if (cell == nil) {
//        cell = [[DefaultCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
//    }
//    return cell;
    DefaultCell *cell = [[DefaultCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
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
    
    _label = [UILabel new];
//    _label.text = @"2131231231231231";
//    _label.textColor = [UIColor redColor];
//    _label.font = [UIFont systemFontOfSize:17 weight:UIFontWeightBlack];
    //_label.frame = CGRectMake(0, 0, self.frame.size.width, 45);
   // _label.backgroundColor = [UIColor redColor];
    [self addSubview:_label];
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self).offset(5);
        make.bottom.equalTo(self.mas_bottom).offset(-5);
        make.right.equalTo(self.mas_right).offset(-5);
    }];
}

-(void)setTextString:(NSString *)textString{

  //  NSLog(@"log =--->%@",textString);
    
    _label.text = textString;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

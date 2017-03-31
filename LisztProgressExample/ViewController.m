//
//  ViewController.m
//  LisztProgressExample
//
//  Created by Liszt on 2017/3/30.
//  Copyright © 2017年 LisztCoder. All rights reserved.
//

#import "ViewController.h"
#import "LisztProgressHelp.h"
#import "LisztIndicatorView.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
/*tableView*/
@property (weak, nonatomic) IBOutlet UITableView *tableView;
/*类型*/
@property (nonatomic, strong) NSArray *modeArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.modeArray = @[@"正在加载",@"加载失败",@"加载成功",@"提醒"];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.modeArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"LisztCoder";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    cell.textLabel.text = self.modeArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    LisztProgressHelp *progressHUD = [[LisztProgressHelp alloc]initWithView:self.view];
    switch (indexPath.row) {
        case 0:
        {
            [progressHUD showIndeterminateWithMessage:@"正在登陆,请稍后..." duration:2.f complection:^{}];
        }
            break;
        case 1:
        {
            [progressHUD showErrorWithMessage:@"登陆失败,请稍后再试" duration:1.5f];
        }
            break;
        case 2:
        {
            [progressHUD showSuccessWithMessage:@"恭喜你,登陆成功" duration:1.5f];
        }
            break;
            
        case 3:
        {
            [progressHUD showMessage:@"普通文本提醒" duration:1.5f];
        }
            break;
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

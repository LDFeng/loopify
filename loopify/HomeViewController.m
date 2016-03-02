//
//  HomeViewController.m
//  loopify
//
//  Created by 欢趣 on 16/3/1.
//  Copyright © 2016年 halleyaps. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeCell.h"
@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArr;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArr = [[NSMutableArray alloc] init];
    [self createTableView];
    [self getDataLoad];
    // Do any additional setup after loading the view.
}

- (void)getDataLoad {
    [[APIDataLoad defaultAPI] readHotWithPage:1 block:^(NSArray *objects, NSError *error) {
        [self.dataArr addObjectsFromArray:objects];
        [self.tableView reloadData];
    }];
    
}


- (void)createTableView {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:self.tableView];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"home"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HomeCell" owner:self options:nil]lastObject];
    }
    AVObject *object = self.dataArr[indexPath.row];
    cell.timeLab.text = [LZWHelp stringFromDate:object.createdAt];
    cell.titleLab.text = [object valueForKey:@"Title"];
    AVFile *file = [object valueForKey:@"image"];
    [cell.bgImg sd_setImageWithURL:[NSURL URLWithString:file.url]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 188;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if ([AVUser currentUser] == nil) {
        NSString *cls = NSStringFromClass(self.class);
        [LZWHelp setValue:cls forKey:@"cls"];
    }
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

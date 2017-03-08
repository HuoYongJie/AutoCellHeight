//

//

//

#import "ViewController.h"
#import "BaseTableViewCell.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>
{
    
}

@property (nonatomic,strong)  UITableView *tableView;

@property (nonatomic,strong) NSMutableArray *cellFrames;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 40, self.view.frame.size.width, self.view.frame.size.height-40) style:UITableViewStylePlain];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    [self.view addSubview:self.tableView];
    [self registNotifaction];
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)registNotifaction
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadCell:) name:@"SelectionViewController" object:nil];
    
}
//刷新cell
- (void)reloadCell:(NSNotification *)info
{
    NSDictionary *dict=info.userInfo;
    NSString *picHeight=[[dict objectForKey:@"Height"] stringValue];
    NSIndexPath *indexpath=[dict objectForKey:@"indexPath"];
    if ( self.cellFrames.count>=indexpath.row) {
        CellFrameModel *modelFrame=[self.cellFrames objectAtIndex:indexpath.row];
        modelFrame.cellModel.picH=picHeight;
        modelFrame.cellModel=modelFrame.cellModel;
        [self.cellFrames replaceObjectAtIndex:indexpath.row withObject:modelFrame];
        [self.tableView reloadData];
    }
}

-(NSArray *)cellFrames
{
    if (_cellFrames == nil) {
        NSString *path=[[NSBundle mainBundle] pathForResource:@"statuses.plist" ofType:nil];
        NSArray *dicArray=[NSArray arrayWithContentsOfFile:path];
        NSMutableArray *cellsFrameArray=[NSMutableArray array];
        for (NSDictionary *dict in dicArray) {
            CellModel *model=[CellModel modelWithDict:dict];
            CellFrameModel *modelFrame=[[CellFrameModel alloc] init];
            modelFrame.cellModel=model;
        
            [cellsFrameArray addObject:modelFrame];            
        }
        _cellFrames = cellsFrameArray;
    }
    return _cellFrames;
}


#pragma mark - 实现数据源方法
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cellFrames.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID=@"cell";
    BaseTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell=[[BaseTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    else
    {
        for (UIView *sub in cell.contentView.subviews) {
            if ([sub isKindOfClass:[UIImageView class]]) {
                UIImageView *tempImageView= (UIImageView *)sub;
                tempImageView.image=nil;
            }
            if ([sub isKindOfClass:[UILabel class]]) {
                UILabel *tempUILabel= (UILabel *)sub;
                tempUILabel.text=nil;
            }
            
        }
    }
    [cell showCellWithModel:self.cellFrames[indexPath.row] indexPath:indexPath];
    return cell;
    
}

#pragma mark - 实现代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
   CellFrameModel *cellFrame = self.cellFrames[indexPath.row];
    return cellFrame.cellHeight;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

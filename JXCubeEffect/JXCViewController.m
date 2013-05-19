//
//  JXCViewController.m
//  JXCubeEffect
//
//  Created by Jun on 5/18/13.
//
//

#import "JXCViewController.h"
#import "JXCCubeTransform.h"

#define screenHeight ([[UIScreen mainScreen]bounds].size.height)
#define screenWidth ([[UIScreen mainScreen]bounds].size.width)
@interface JXCViewController (){
    float _newOriginX;
    float _newOriginY;
    
    JXCCubeTransform *_transform;
}
@property (nonatomic,strong)UIView* contentView;
@property (nonatomic,strong)UILabel* contentLabel;
@end

@implementation JXCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self produceViews];
    _transform = [[JXCCubeTransform alloc]init];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)produceViews{
    for (int i = 0; i<6; i++) {
        _newOriginX = 0;
        _newOriginY = screenHeight *i;
        _contentView = [[UIView alloc]initWithFrame:CGRectMake(_newOriginX, _newOriginY, screenWidth, screenHeight)];
        [_contentView setTag:i];
        if (i%2 == 0) {
            [_contentView setBackgroundColor:[UIColor cyanColor]];
        }
        else{
            [_contentView setBackgroundColor:[UIColor redColor]];
        }
        
        _contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, 200, 100)];
        [_contentLabel setTag:i];
        [_contentLabel setText:[NSString stringWithFormat:@"%i",i]];
        if (i == 0) {
            [_contentLabel setText:@"Swipe Up"];
        }
        [_contentLabel setBackgroundColor:[UIColor clearColor]];
        [_contentLabel setTextColor:[UIColor blackColor]];
        [_contentLabel setTextAlignment:NSTextAlignmentCenter];
        [_contentLabel setFont:[UIFont fontWithName:@"Arial" size:25]];
        
        [_contentView addSubview:_contentLabel];
        [_contentView bringSubviewToFront:_contentLabel];
        [_scrollView addSubview:_contentView];
    }
    [_scrollView setContentSize:CGSizeMake(screenWidth, screenHeight*6)];
    [_scrollView setBackgroundColor:[UIColor colorWithRed:0.1f green:0.1f blue:0.1f alpha:1]];
}

#pragma mark scrollview delegate

/* It's gonna be painful here if you have a hundred pages in scrollview */
-(void)scrollViewDidScroll:(UIScrollView *)sender{
    if (sender.contentOffset.y >= 0 && sender.contentOffset.y <= screenHeight) {
        [_transform transform:-(sender.contentOffset.y/800) x:10 y:0 z:0 inView:[_scrollView.subviews objectAtIndex:0]];
    }
    else if (sender.contentOffset.y >= screenHeight && sender.contentOffset.y <= screenHeight*2){
        [_transform transform:-((sender.contentOffset.y-screenHeight*1)/800) x:10 y:0 z:0 inView:[_scrollView.subviews objectAtIndex:1]];
        
    }
    else if (sender.contentOffset.y >= screenHeight && sender.contentOffset.y <= screenHeight*3){
        [_transform transform:-((sender.contentOffset.y-screenHeight*2)/800) x:10 y:0 z:0 inView:[_scrollView.subviews objectAtIndex:2]];
        
    }
    else if (sender.contentOffset.y >= screenHeight && sender.contentOffset.y <= screenHeight*4){
        [_transform transform:-((sender.contentOffset.y-screenHeight*3)/800) x:10 y:0 z:0 inView:[_scrollView.subviews objectAtIndex:3]];
        
    }
    else if (sender.contentOffset.y >= screenHeight && sender.contentOffset.y <= screenHeight*5){
        [_transform transform:-((sender.contentOffset.y-screenHeight*4)/800) x:10 y:0 z:0 inView:[_scrollView.subviews objectAtIndex:4]];
        
    }
    else if (sender.contentOffset.y >= screenHeight && sender.contentOffset.y <= screenHeight*6){
        [_transform transform:-((sender.contentOffset.y-screenHeight*5)/800) x:10 y:0 z:0 inView:[_scrollView.subviews objectAtIndex:5]];
    }

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

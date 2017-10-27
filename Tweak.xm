#include <UIKit/UITableViewCell.h>

%hook UITableViewCell
-(void) layoutSubviews {
    
    if ([self.textLabel.text isEqualToString:@"App Icon"]) {
        self.textLabel.text = @"";
        self.hidden = YES;
        self.userInteractionEnabled = NO;
    }
    else {
        %orig;
    }
}
%end

%hook UITableView

-(double) sectionHeaderHeight {
    return 0;
}

-(double) sectionFooterHeight {
    return 0;
}

-(void) setSeparatorStyle:(long long)arg1 {
    arg1 = 0;
    return %orig;
}

-(bool) _shouldDrawSeparatorAtTopOfSection:(long long)arg1 {
    return YES;
}
%end

%hook _UIGroupTableViewCellBackgroundImageKey
-(int) sectionLocation {
    return 1;
}
%end


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
-(double) _dataSourceHeightForHeaderInSection:(long long)arg1 {
return %orig;
}

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
return TRUE;
}
%end

%hook UITableViewCell
-(void) _setShouldHaveFullLengthBottomSeparator:(bool)arg1 {
return %orig;
}
%end

%hook _UIGroupTableViewCellBackgroundImageKey
-(int) sectionLocation {
return 1;
}
%end


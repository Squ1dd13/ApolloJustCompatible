#include <UIKit/UITableViewCell.h>

//Apollo is Swift, so we will use an Objective-C class rather than a Swift one. (Swift classes are harder to hook)

%hook UITableViewCell
-(void) layoutSubviews {
    
    if ([self.textLabel.text isEqualToString:@"App Icon"]) {    //Detect the cell that says "App Icon" because that won't work below 10.3.3
        self.textLabel.text = @"";
        self.hidden = YES;      //Hide it
    }
    else {
        %orig;      //If it doesn't say "App Icon", leave it alone.
    }
}
%end

//The next bit is supposed to hide the space that was created when we removed the cell. Supposed to.

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


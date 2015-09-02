//
//  HMStopWatchHelper.hpp
//  HMStopWatch
//
//  Created by MuronakaHiroaki on 2015/09/02.
//  Copyright © 2015年 hmu. All rights reserved.
//

#ifndef HMStopWatchHelper_hpp
#define HMStopWatchHelper_hpp

#include<sys/time.h>

timeval getDifferenceTimeVal(const timeval& startTime, const timeval& endTime);

#endif /* HMStopWatchHelper_hpp */

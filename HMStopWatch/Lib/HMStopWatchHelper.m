//
//  HMStopWatchHelper.c
//  HMStopWatch
//
//  Created by MuronakaHiroaki on 2015/09/02.
//  Copyright © 2015年 hmu. All rights reserved.
//

#include <string.h>

#include "HMStopWatchHelper.h"

HMTimeVal hm_getDifferenceTimeVal(const HMTimeVal* beginTime, const HMTimeVal* endTime) {
    
    HMTimeVal result;
    memset(&result, 0, sizeof(result));
    
    result.tv_sec = endTime->tv_sec - beginTime->tv_sec;
    result.tv_usec = endTime->tv_usec - beginTime->tv_usec
    
    
    
    
    
    
}


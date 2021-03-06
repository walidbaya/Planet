//
//  main.m
//  BlurMenu
//
//  Created by Ali Yılmaz on 05/02/14.
//  Copyright (c) 2014 Ali Yılmaz. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"
#include "RegisterClasses.h"
#include "RegisterMonoModules.h"
#include "RegisterFeatures.h"

//static const int constsection = 0;

void UnityInitTrampoline();


#if INIT_SCRIPTING_BACKEND
extern "C" void InitializeScriptingBackend();
#endif

// WARNING: this MUST be c decl (NSString ctor will be called after +load, so we cant really change its value)
const char* AppControllerClassName = "UnityAppController";

int main(int argc, char * argv[])
{
    
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
#include <time.h>
#include <dirent.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/wait.h>
#include <unistd.h>
#include <stdlib.h>

#if TARGET_IPHONE_SIMULATOR
extern "C" clock_t clock$UNIX2003() { return clock(); }
extern "C" void closedir$UNIX2003(DIR *dirp) { closedir(dirp); }
extern "C" FILE* fdopen$UNIX2003(int fildes, const char* mode) { return fdopen(fildes, mode); }
extern "C" FILE* fopen$UNIX2003(const char* path, const char* mode) { return fopen(path, mode); }
extern "C" int fputs$UNIX2003(const char* s, FILE* stream) { return fputs(s, stream); }
extern "C" size_t fwrite$UNIX2003(const void* ptr, size_t size, size_t nitems, FILE* stream) { return fwrite(ptr, size, nitems, stream); }
extern "C" time_t mktime$UNIX2003(tm* timeptr) { return mktime(timeptr); }
extern "C" int nanosleep$UNIX2003(const timespec* rqtp, timespec* rmtp) { return nanosleep(rqtp, rmtp); }
extern "C" DIR* opendir$INODE64$UNIX2003(const char* dirname) { return opendir(dirname); }
extern "C" dirent* readdir$INODE64(DIR* dirp) { return readdir(dirp); }
extern "C" ssize_t recv$UNIX2003(int socket, void* buffer, size_t length, int flags) { return recv(socket, buffer, length, flags); }
extern "C" ssize_t send$UNIX2003(int socket, const void *buffer, size_t length, int flags) { return send(socket, buffer, length, flags); }
extern "C" int setenv$UNIX2003(const char* envname, const char* envval, int overwrite) { return setenv(envname, envval, overwrite); }
extern "C" int sigaltstack$UNIX2003(const stack_t* ss, stack_t* oss) { return sigaltstack(ss, oss); }
extern "C" unsigned sleep$UNIX2003(unsigned seconds) { return sleep(seconds); }
extern "C" char *strerror$UNIX2003(int errnum) { return strerror(errnum); }
extern "C" size_t strftime$UNIX2003(char* s, size_t maxsize, const char* format, const tm* timeptr) { return strftime(s, maxsize, format, timeptr); }
extern "C" int system$UNIX2003(const char* command) { return system(command); }
extern "C" int unsetenv$UNIX2003(const char* name) { return unsetenv(name); }
extern "C" pid_t waitpid$UNIX2003(pid_t pid, int *stat_loc, int options) { return waitpid(pid, stat_loc, options); }
#endif // TARGET_IPHONE_SIMULATOR


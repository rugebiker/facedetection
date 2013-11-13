SYSTEM = pearl_system
PROGRAMS = faceDetection
METHODS = crun sched

SIMULATION_ARGS = -verbose
#faceDetection.c -> host.c
HOST_FILES= src/host.c
HOST_CFLAGS = -W -Wall 

#CUSTOM_HOST = hive
#hive_CC = $(HIVEBIN)/hivecc -m pearl -mdir $(HIVECORES) 
#hive_CPP = cpp -D__HIVECC

faceDetection_CELL = pearl
faceDetection_FILES = src/haar.hive.c
faceDetection_OUT = haar.hive
faceDetection_CFLAGS = -html

detectObjects_LDFLAGS = -Map decrypt.map.h

include $(HIVEBIN)/../share/apps/hive_make.mk

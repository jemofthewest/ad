CFLAGS=-g -Wall
CC=gcc
LIBS=-lm

all: rosenbrock rosenbrock_d

clean:
	rm -rf rosenbrock rosenbrock_d

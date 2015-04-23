# Copyright (c) 2015 zhichenghou@gmail.com. All rights reserved.

#-----------------------------------------------
# Uncomment exactly one of the lines labelled (A), (B), and (C) below
# to switch between compilation modes.

# (A) Production use (optimized mode)
# OPT ?= -O2 -DNDEBUG
# (B) Debug mode, w/ full line-level debugging symbols
OPT ?= -g2
# (C) Profiling mode: opt, but w/debugging symbols
# OPT ?= -O2 -g2 -DNDEBUG
#-----------------------------------------------

CC = cc
CXX = c++

INC += -I. -I./include
CFLAGS += $(INC) $(OPT)
CXXFLAGS += -std=c++11 $(INC) $(OPT)

LDFLAGS += -std=c++11
LIBS += 

SRCDIR := src
BUILDDIR := build
BINDIR := bin

SRCEXT := cpp

SOURCES := $(shell find $(SRCDIR) -type f -name *.$(SRCEXT) -not -name *_test.$(SRCEXT))
LIBOBJECTS := $(patsubst $(SRCDIR)/%,$(BUILDDIR)/%,$(SOURCES:.$(SRCEXT)=.o))

TESTS := $(shell find $(SRCDIR) -type f -name *_test.$(SRCEXT))
TESTOBJECTS := $(patsubst $(SRCDIR)/%,$(BINDIR)/%,$(TESTS:.$(SRCEXT)=))

# for all objects 
all: $(LIBOBJECTS)

TARGET := $(BINDIR)/run

bin: $(TARGET)

$(TARGET): $(LIBOBJECTS)
	@mkdir -p $(BINDIR)
	$(CXX) $(LDFLAGS) $(LIBOBJECTS) -o $(TARGET) $(LIBS)

$(BUILDDIR)/%.o: $(SRCDIR)/%.$(SRCEXT)
	@mkdir -p $(BUILDDIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@ 

# for tests
test: $(TESTOBJECTS)
	@for t in $(TESTOBJECTS); do echo "***** Running $$t"; $$t || exit 1; done

$(BINDIR)/%_test: $(SRCDIR)/%_test.$(SRCEXT) $(SRCDIR)/%.$(SRCEXT)
	@mkdir -p $(BINDIR)
	$(CXX) $(CXXFLAGS) -o $@ $^

# for quick test
main: 
	@mkdir -p $(BINDIR)
	$(CXX) $(CXXFLAGS) -o $(BINDIR)/main $(SRCDIR)/func_test.cpp $(SRCDIR)/func.cpp 

# clean
clean:
	@echo " Cleaning..."; 
	$(RM) -r $(BUILDDIR) $(BINDIR)

.PHONY: all bin test clean main
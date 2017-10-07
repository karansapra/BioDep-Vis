CXX  = g++
NVCC = nvcc

CUDADIR ?= /usr/local/cuda
GLUIDIR ?= glui-2.37

CXXFLAGS = -std=c++11 -I $(GLUIDIR)/include -g

LIBS = -lGL -lGLU -lglut \
	   -L $(CUDADIR)/lib64 -lcudart \
	   -L $(GLUIDIR)/lib -lglui

SRC = src
OBJDIR = obj
OBJS = \
	$(OBJDIR)/alignment.o \
	$(OBJDIR)/Camera.o \
	$(OBJDIR)/cuda_code.o \
	$(OBJDIR)/events.o \
	$(OBJDIR)/graph.o \
	$(OBJDIR)/jsoncpp.o \
	$(OBJDIR)/lodepng.o \
	$(OBJDIR)/main.o \
	$(OBJDIR)/Matrix.o \
	$(OBJDIR)/miscgl.o \
	$(OBJDIR)/Ont.o \
	$(OBJDIR)/parse.o \
	$(OBJDIR)/util.o \
	$(OBJDIR)/Utility.o \
	$(OBJDIR)/Vector.o
BINS = biodep-vis

all: $(BINS)

$(OBJDIR):
	mkdir -p $(OBJDIR)

$(OBJDIR)/%.o: $(SRC)/%.cu | $(OBJDIR)
	$(NVCC) -c $(CXXFLAGS) -o $@ $<

$(OBJDIR)/%.o: $(SRC)/%.cpp | $(OBJDIR)
	$(CXX) -c $(CXXFLAGS) -o $@ $<

biodep-vis: $(OBJS)
	$(CXX) -o $@ $^ $(LIBS)

clean:
	rm -rf $(OBJDIR) $(BINS)

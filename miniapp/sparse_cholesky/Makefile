include Makefile.conf

CC       = mpicxx
# CFLAGS   = -fsanitize=address -fsanitize=undefined -pthread -O1 -g -std=c++14
CFLAGS   = -pthread -O3 -g -std=c++14 -DEIGEN_NO_DEBUG
INCLUDE  += -I../../
LIBS     += 
SRCDIR   = ../../tasktorrent/src
OBJDIR   = ../../build

.PHONY: clean

DEPS := $(wildcard $(SRCDIR)/*.hpp)
SRCS := $(wildcard $(SRCDIR)/*.cpp)
OBJ := $(patsubst $(SRCDIR)/%.cpp,$(OBJDIR)/%.o,$(SRCS))

default: all
all: snchol

$(OBJDIR)/%.o: $(SRCDIR)/%.cpp $(DEPS)
	$(CC) -o $@ -c $< $(CFLAGS) $(INCLUDE)

snchol: snchol.cpp $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^ $(INCLUDE) $(LIBS)

clean:
	rm -f *.o $(OBJDIR)/*.o
	rm -f snchol

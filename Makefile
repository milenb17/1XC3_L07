CC = gcc
CFLAGS = -Wall
BUILD_DIR = build
SRC_DIR = src
all_targets = multiply max square

library.o : $(SRC_DIR)/library.c
	./mkbuild_dir.sh
	$(CC) $(CFLAGS) -c $<; \
	mv $@ $(BUILD_DIR)/$@

multiply : $(SRC_DIR)/multiply.c library.o
	$(CC) $(CFLAGS) -o $@  $< $(BUILD_DIR)/library.o; \
	mv $@ $(BUILD_DIR)/$@

max : $(SRC_DIR)/max.c $(BUILD_DIR)/library.o
	$(CC) $(CFLAGS) -o $@ $^; \
	mv $@ $(BUILD_DIR)/$@
square : $(SRC_DIR)/square.c $(BUILD_DIR)/library.o
	$(CC) $(CFLAGS) -o $@ $^;
	mv $@ $(BUILD_DIR)/$@; 

clean : 
	rm -rf $(BUILD_DIR); \
	rm -rf test
all : $(all_targets)

test : all
	mkdir -p test; \
	$(BUILD_DIR)/square inches < test_data/square_input.txt > test/square_output.txt; \
	diff test_data/square_expected.txt test/square_output.txt; \
	$(BUILD_DIR)/multiply 2 < test_data/multiply_input.txt > test/multiply_output.txt; \
	diff test_data/multiply_expected.txt test/multiply_output.txt; \
	$(BUILD_DIR)/max 4 3 2 1 5 7 8 10 6 > test/max_output.txt; \
	diff test_data/max_expected.txt test/max_output.txt; \
	rm -rf test

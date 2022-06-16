all:
	gcc -Wall ssd_fuse.c `pkg-config fuse3 --cflags --libs` -D_FILE_OFFSET_BITS=64 -o ssd_fuse
	gcc -Wall ssd_fuse_dut.c -o ssd_fuse_dut
	mkdir /tmp/ssd
	./ssd_fuse -d /tmp/ssd
clean:
	fusermount -u /tmp/ssd
	rm -rf /tmp/ssd ssd_fuse ssd_fuse_dut
test:
	sh ./test.sh test1
	sh ./test.sh test2
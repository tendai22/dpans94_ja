.SUFFIXES: .md _x.md
DEST = .
VPATH = .

TOC_TARGET =cover_x.md test_x.md \
		part1_x.md \
		part2_x.md \
		eob.md

TARGET = $(TOC_TARGET)

.md_x.md:
	( sh do_desc.sh $< )  > $(DEST)/$@

all: output.pdf

output.pdf: $(TARGET) css/sample1.css vivliostyle.config.js
	vivliostyle build -t 1200

#toc.md: $(TOC_TARGET)
#	sh maketoc2.sh $(TOC_TARGET) > toc.md

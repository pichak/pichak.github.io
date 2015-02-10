ROOT = .
OUT = ${ROOT}/css

BLOG_LESS = ${ROOT}/less/blog.less

DATE=$(shell date +%I:%M%p)
CHECK=\033[32m✔\033[39m
HR=\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#


#
# BUILD
#
build: blog

#
# CLEANS THE ROOT DIRECTORY OF PRIOR BUILDS
#
clean:
	@rm -f ${ROOT}/css/blog.css
	@rm -r ${ROOT}/_site

blog:
	@echo "Building blog css"
	@recess --compress ${BLOG_LESS} > ${OUT}/blog.min.css
	@jekyll build

serve:
	@jekyll serve

#
# WATCH LESS FILES
#

watch:
	@echo "Watching less files...";
	@watchr ${ROOT}/less 

.PHONY: blog

# adapted from John Kitchin's page :
# https://github.com/jkitchin/jkitchin.github.com/tree/source
Sources = $(wildcard _posts/* _templates/*)

build:	${SOURCES}
	blogofile build

serve:
	blogofile serve 

status:
	cd _deploy && ls

deploy:
	cp -r org _site/
	rsync -avz --delete --exclude=.git _site/ _deploy
	cd _deploy; git add . && git add -u &&	git commit -m "deployment" && git push origin master --force

#	cd _deploy; git add . && git add -u && git commit -m "source-commit" && git push --force
